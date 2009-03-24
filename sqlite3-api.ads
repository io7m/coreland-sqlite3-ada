with Ada.Strings.Unbounded;
with C_String.Arrays;
with SQLite3.Types;

generic
  type User_Data_Type is private;
  type User_Data_Access_Type is access all User_Data_Type;

package SQLite3.API is
  package US renames Ada.Strings.Unbounded;

  -- generic exception type
  Database_Error : exception;

  -- error code
  type Error_t is
   (Error_OK,
    Error_Error,
    Error_Internal,
    Error_Perm,
    Error_Abort,
    Error_Busy,
    Error_Locked,
    Error_No_Mem,
    Error_Read_Only,
    Error_Interrupt,
    Error_IO_Error,
    Error_Corrupt,
    Error_Not_Found,
    Error_Full,
    Error_Cant_Open,
    Error_Protocol,
    Error_Empty,
    Error_Schema,
    Error_Too_Big,
    Error_Constraint,
    Error_Mismatch,
    Error_Misuse,
    Error_Nolfs,
    Error_Auth,
    Error_Format,
    Error_Range,
    Error_Not_A_DB,
    Error_Row,
    Error_Done);

  for Error_t use
   (Error_OK         => 0, --    successful result
    Error_Error      => 1, --    sql error or missing database
    Error_Internal   => 2, --    not used. internal logic error in error
    Error_Perm       => 3, --    access permission denied
    Error_Abort      => 4, --    callback routine requested an abort
    Error_Busy       => 5, --    the database file is locked
    Error_Locked     => 6, --    a table in the database is locked
    Error_No_Mem     => 7, --    a malloc() failed
    Error_Read_Only  => 8, --    attempt to write a readonly database
    Error_Interrupt  => 9, --    operation terminated by error3_interrupt()
    Error_IO_Error   => 10, --    some kind of disk i/o error occurred
    Error_Corrupt    => 11, --    the database disk image is malformed
    Error_Not_Found  => 12, --    not used. table or record not found
    Error_Full       => 13, --    insertion failed because database is full
    Error_Cant_Open  => 14, --    unable to open the database file
    Error_Protocol   => 15, --    not used. database lock protocol error
    Error_Empty      => 16, --    database is empty
    Error_Schema     => 17, --    the database schema changed
    Error_Too_Big    => 18, --    string or blob exceeds size limit
    Error_Constraint => 19, --    abort due to contraint violation
    Error_Mismatch   => 20, --    data type mismatch
    Error_Misuse     => 21, --    library used incorrectly
    Error_Nolfs      => 22, --    uses os features not supported on host
    Error_Auth       => 23, --    authorization denied
    Error_Format     => 24, --    auxiliary database format error
    Error_Range      => 25, --    2nd parameter to error3_bind out of range
    Error_Not_A_DB   => 26, --    file opened that is not a database file
    Error_Row        => 100, --   error3_step() has another row ready
    Error_Done       => 101  --   error3_step() has finished executing
  );
  for Error_t'Size use SQLite3.Types.int_t'Size;
  pragma Convention (C, Error_t);

  type Mode_t is mod 2 ** 32;
  OPEN_READONLY       : constant Mode_t := 16#00000001#;
  OPEN_READWRITE      : constant Mode_t := 16#00000002#;
  OPEN_CREATE         : constant Mode_t := 16#00000004#;
  OPEN_DELETEONCLOSE  : constant Mode_t := 16#00000008#;
  OPEN_EXCLUSIVE      : constant Mode_t := 16#00000010#;
  OPEN_MAIN_DB        : constant Mode_t := 16#00000100#;
  OPEN_TEMP_DB        : constant Mode_t := 16#00000200#;
  OPEN_TRANSIENT_DB   : constant Mode_t := 16#00000400#;
  OPEN_MAIN_JOURNAL   : constant Mode_t := 16#00000800#;
  OPEN_TEMP_JOURNAL   : constant Mode_t := 16#00001000#;
  OPEN_SUBJOURNAL     : constant Mode_t := 16#00002000#;
  OPEN_MASTER_JOURNAL : constant Mode_t := 16#00004000#;
  OPEN_NOMUTEX        : constant Mode_t := 16#00008000#;
  OPEN_FULLMUTEX      : constant Mode_t := 16#00010000#;

  type Column_Names_t is new C_String.Arrays.String_Array_t;
  type Column_Values_t is new C_String.Arrays.String_Array_t;

  procedure Open
   (File_Name : String;
    Mode      : Mode_t := OPEN_READWRITE or OPEN_CREATE;
    Database  : out SQLite3.Types.Database_t);
  pragma Inline (Open);

  type Exec_Callback_t is access procedure
    (Column_Names  : Column_Names_t;
     Column_Values : Column_Values_t;
     User_Data     : User_Data_Access_Type);

  procedure Exec
   (Database      : SQLite3.Types.Database_t;
    SQL           : String;
    Error         : out Boolean;
    Error_Message : out US.Unbounded_String;
    Callback      : Exec_Callback_t       := null;
    User_Data     : User_Data_Access_Type := null);
  pragma Inline (Exec);

  procedure Close (Database : SQLite3.Types.Database_t);
  pragma Inline (Close);

  function Error_Message (Database : SQLite3.Types.Database_t) return String;
  pragma Inline (Error_Message);

  function Error_Code (Database : SQLite3.Types.Database_t) return Error_t;
  pragma Inline (Error_Code);

end SQLite3.API;
