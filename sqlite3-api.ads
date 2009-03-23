with ada.strings.unbounded;
with SQLite3.types;

generic
  type User_Data_Type is private;
  type User_Data_Access_Type is access all User_Data_Type;

package SQLite3.API is
  package US renames ada.strings.unbounded;

  -- generic exception type
  database_error : exception;

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
    Error_Done
  );
 
  for Error_t use
   (Error_OK          => 0, --    successful result 
    Error_Error       => 1, --    sql error or missing database 
    Error_Internal    => 2, --    not used. internal logic error in error 
    Error_Perm        => 3, --    access permission denied 
    Error_Abort       => 4, --    callback routine requested an abort 
    Error_Busy        => 5, --    the database file is locked 
    Error_Locked      => 6, --    a table in the database is locked 
    Error_No_Mem      => 7, --    a malloc() failed 
    Error_Read_Only   => 8, --    attempt to write a readonly database 
    Error_Interrupt   => 9, --    operation terminated by error3_interrupt()
    Error_IO_Error    => 10, --    some kind of disk i/o error occurred 
    Error_Corrupt     => 11, --    the database disk image is malformed 
    Error_Not_Found   => 12, --    not used. table or record not found 
    Error_Full        => 13, --    insertion failed because database is full 
    Error_Cant_Open   => 14, --    unable to open the database file 
    Error_Protocol    => 15, --    not used. database lock protocol error 
    Error_Empty       => 16, --    database is empty 
    Error_Schema      => 17, --    the database schema changed 
    Error_Too_Big     => 18, --    string or blob exceeds size limit 
    Error_Constraint  => 19, --    abort due to contraint violation 
    Error_Mismatch    => 20, --    data type mismatch 
    Error_Misuse      => 21, --    library used incorrectly 
    Error_Nolfs       => 22, --    uses os features not supported on host 
    Error_Auth        => 23, --    authorization denied 
    Error_Format      => 24, --    auxiliary database format error 
    Error_Range       => 25, --    2nd parameter to error3_bind out of range 
    Error_Not_A_DB    => 26, --    file opened that is not a database file 
    Error_Row         => 100, --   error3_step() has another row ready 
    Error_Done        => 101  --   error3_step() has finished executing 
  );
  for Error_t'size use SQLite3.types.int_t'size;
  pragma convention (c, Error_t);

  type mode_t is mod 2 ** 32;
  OPEN_READONLY       : constant mode_t := 16#00000001#;
  OPEN_READWRITE      : constant mode_t := 16#00000002#;
  OPEN_CREATE         : constant mode_t := 16#00000004#;
  OPEN_DELETEONCLOSE  : constant mode_t := 16#00000008#;
  OPEN_EXCLUSIVE      : constant mode_t := 16#00000010#;
  OPEN_MAIN_DB        : constant mode_t := 16#00000100#;
  OPEN_TEMP_DB        : constant mode_t := 16#00000200#;
  OPEN_TRANSIENT_DB   : constant mode_t := 16#00000400#;
  OPEN_MAIN_JOURNAL   : constant mode_t := 16#00000800#;
  OPEN_TEMP_JOURNAL   : constant mode_t := 16#00001000#;
  OPEN_SUBJOURNAL     : constant mode_t := 16#00002000#;
  OPEN_MASTER_JOURNAL : constant mode_t := 16#00004000#;
  OPEN_NOMUTEX        : constant mode_t := 16#00008000#;
  OPEN_FULLMUTEX      : constant mode_t := 16#00010000#;

  type column_names_t is array (natural range <>) of us.unbounded_string;
  type column_values_t is array (natural range <>) of us.unbounded_string;

  type exec_callback_t is access procedure
    (column_names  : column_names_t;
     column_values : column_values_t;
     User_Data     : User_Data_access_type);

  procedure open
    (filename : string;
     mode     : mode_t := OPEN_READWRITE or OPEN_CREATE;
     database : out SQLite3.types.database_t);
  pragma inline (open);

  procedure exec
    (database      : SQLite3.types.database_t;
     sql           : string;
     error         : out boolean;
     Error_Message : out us.unbounded_string;
     callback      : exec_callback_t          := null;
     User_Data     : User_Data_access_type    := null);
  pragma inline (exec);

  procedure close
    (database : SQLite3.types.database_t);
  pragma inline (close);

  function Error_Message
    (database : SQLite3.types.database_t) return string;
  pragma inline (Error_Message);

end SQLite3.API;
