with Interfaces.C.Strings;
with Interfaces.C;
with SQLite3.Constants;
with SQLite3.Thin;

package body SQLite3.API is
  package C renames Interfaces.C;
  package CS renames Interfaces.C.Strings;

  use type CS.chars_ptr;
  use type SQLite3.Types.int_t;

  type CBridge_Context_t is record
    User_Data : User_Data_Access_Type;
    Callback  : access procedure
      (Column_Names  : Column_Names_t;
       Column_Values : Column_Values_t;
       User_Data     : User_Data_Access_Type);
  end record;
  pragma Convention (C, CBridge_Context_t);

  function Exec_CBridge
    (context       : access CBridge_Context_t;
     num_columns   : SQLite3.Types.int_t;
     Column_Values : SQLite3.Types.char_2star_t;
     Column_Names  : SQLite3.Types.char_2star_t) return SQLite3.Types.int_t;
  pragma Convention (C, Exec_CBridge);

  --
  -- type conversion Callback
  --

  function Exec_CBridge
    (context       : access CBridge_Context_t;
     num_columns   : SQLite3.Types.int_t;
     Column_Values : SQLite3.Types.char_2star_t;
     Column_Names  : SQLite3.Types.char_2star_t) return SQLite3.Types.int_t
  is
    array_size        : constant Natural := Natural (num_columns);
    Ada_Column_Values : constant Column_Values_t := SQLite3.API.Convert (Column_Values, array_size);
    Ada_Column_Names  : constant Column_Names_t := SQLite3.API.Convert (Column_Names, array_size);
  begin
    -- call Ada Callback with new arrays
    context.all.Callback
      (Column_Names  => Ada_Column_Names,
       Column_Values => Ada_Column_Values,
       User_Data     => context.all.User_Data);
    return 0;
  end Exec_CBridge;

  type CBridge_Callback_t is access function
    (context       : access CBridge_Context_t;
     num_columns   : SQLite3.Types.int_t;
     Column_Values : SQLite3.Types.char_2star_t;
     Column_Names  : SQLite3.Types.char_2star_t) return SQLite3.Types.int_t;
  pragma Convention (C, CBridge_Callback_t);

  -- not using the version from the Thin binding due to needing
  -- specific User_Data and Callback Types

  function SQLite3_exec
    (Database      : SQLite3.Types.Database_t;
     SQL           : CS.chars_ptr;
     Callback      : CBridge_Callback_t;
     context       : access CBridge_Context_t;
     Error_Message : SQLite3.Types.char_2star_t) return SQLite3.Types.int_t;
  pragma Import (C, SQLite3_exec, "sqlite3_exec");

  procedure SQLite3_free (data : CS.chars_ptr);
  pragma Import (C, SQLite3_free, "sqlite3_free");

  --
  -- exec SQL
  --

  procedure Exec
   (Database      : SQLite3.Types.Database_t;
    SQL           : String;
    Error         : out Boolean;
    Error_Message : out US.Unbounded_String;
    Callback      : Exec_Callback_t       := null;
    User_Data     : User_Data_Access_Type := null)
  is
    -- data to pass to C Callback
    C_Context : aliased CBridge_Context_t := (User_Data, Callback);

    -- C String Types
    SQL_C_Array : aliased C.char_array := C.To_C (SQL);
    Message     : aliased CS.chars_ptr;
    Error_Value : SQLite3.Types.int_t;

  begin
    if Callback /= null then
      -- call SQLite3_exec with type conversion Callback
      Error_Value := SQLite3_exec
        (Database      => Database,
         SQL           => CS.To_Chars_Ptr (SQL_C_Array'Unchecked_Access),
         Callback      => Exec_CBridge'Access,
         Context       => C_Context'Unchecked_Access,
         Error_Message => Message'Address);
    else
      -- don't bother to go to the trouble of type conversion
      Error_Value := SQLite3.Thin.exec
        (DB            => Database,
         SQL           => CS.To_Chars_Ptr (SQL_C_Array'Unchecked_Access),
         Callback      => null,
         Context       => SQLite3.Types.Null_Ptr,
         Error_Message => Message'Address);
    end if;

    -- convert Error message
    if Error_Value /= SQLite3.Constants.SQLITE_OK then
      Error := True;
      US.Set_Unbounded_String (Error_Message, CS.Value (Message));
      SQLite3_free (Message);
    else
      Error := False;
    end if;
  end Exec;

  procedure Close
    (Database : SQLite3.Types.Database_t)
  is
    Error_Code : constant SQLite3.Types.int_t := SQLite3.Thin.close (Database);
  begin
    if Error_Code /= SQLite3.Constants.SQLITE_OK then
      raise Database_Error with Error_Message (Database);
    end if;
  end Close;

  function SQLite3_open_v2
    (file : CS.chars_ptr;
     db   : access SQLite3.Types.Database_t;
     mode : Mode_t;
     vfs  : CS.chars_ptr := CS.Null_Ptr) return SQLite3.Types.int_t;
  pragma Import (C, SQLite3_open_v2, "sqlite3_open_v2");

  procedure Open
    (File_Name : String;
     Mode      : Mode_t := OPEN_READWRITE or OPEN_CREATE;
     Database  : out SQLite3.Types.Database_t)
  is
    Func       : aliased C.char_array := C.To_C (File_Name);
    DB         : aliased SQLite3.Types.Database_t;
    Error_Code : constant SQLite3.Types.int_t := SQLite3_open_v2
      (File => CS.To_Chars_Ptr (Func'Unchecked_Access),
       Mode => Mode,
       DB   => DB'Unchecked_Access);
  begin
    Database := DB;
    if Error_Code /= SQLite3.Constants.SQLITE_OK then
      raise Database_Error with Error_Message (Database);
    end if;
  end Open;

  function Error_Message
    (Database : SQLite3.Types.Database_t) return String is
  begin
    return CS.Value (SQLite3.Thin.errmsg (Database));
  end Error_Message;

end SQLite3.API;
