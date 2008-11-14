with ada.strings.unbounded;
with sqlite3.types;

generic
  type user_data_type is private;
  type user_data_access_type is access all user_data_type;

package sqlite3.api is
  package us renames ada.strings.unbounded;

  -- generic exception type
  database_error : exception;

  -- error code
  type error_t is
   (error_ok,
    error_error,
    error_internal,
    error_perm,
    error_abort,
    error_busy,
    error_locked,
    error_nomem,
    error_readonly,
    error_interrupt,
    error_ioerr,
    error_corrupt,
    error_notfound,
    error_full,
    error_cantopen,
    error_protocol,
    error_empty,
    error_schema,
    error_toobig,
    error_constraint,
    error_mismatch,
    error_misuse,
    error_nolfs,
    error_auth,
    error_format,
    error_range,
    error_notadb,
    error_row,
    error_done
  );
 
  for error_t use
   (error_ok           => 0, --    successful result 
    error_error        => 1, --    sql error or missing database 
    error_internal     => 2, --    not used. internal logic error in error 
    error_perm         => 3, --    access permission denied 
    error_abort        => 4, --    callback routine requested an abort 
    error_busy         => 5, --    the database file is locked 
    error_locked       => 6, --    a table in the database is locked 
    error_nomem        => 7, --    a malloc() failed 
    error_readonly     => 8, --    attempt to write a readonly database 
    error_interrupt    => 9, --    operation terminated by error3_interrupt()
    error_ioerr       => 10, --    some kind of disk i/o error occurred 
    error_corrupt     => 11, --    the database disk image is malformed 
    error_notfound    => 12, --    not used. table or record not found 
    error_full        => 13, --    insertion failed because database is full 
    error_cantopen    => 14, --    unable to open the database file 
    error_protocol    => 15, --    not used. database lock protocol error 
    error_empty       => 16, --    database is empty 
    error_schema      => 17, --    the database schema changed 
    error_toobig      => 18, --    string or blob exceeds size limit 
    error_constraint  => 19, --    abort due to contraint violation 
    error_mismatch    => 20, --    data type mismatch 
    error_misuse      => 21, --    library used incorrectly 
    error_nolfs       => 22, --    uses os features not supported on host 
    error_auth        => 23, --    authorization denied 
    error_format      => 24, --    auxiliary database format error 
    error_range       => 25, --    2nd parameter to error3_bind out of range 
    error_notadb      => 26, --    file opened that is not a database file 
    error_row         => 100, --   error3_step() has another row ready 
    error_done        => 101  --   error3_step() has finished executing 
  );
  for error_t'size use sqlite3.types.int_t'size;
  pragma convention (c, error_t);

  type column_names_t is array (natural range <>) of us.unbounded_string;
  type column_values_t is array (natural range <>) of us.unbounded_string;

  type exec_callback_t is access procedure
    (column_names  : column_names_t;
     column_values : column_values_t;
     user_data     : user_data_access_type);

  procedure open
    (filename : string;
     database : out sqlite3.types.database_t);
  pragma inline (open);

  procedure exec
    (database      : sqlite3.types.database_t;
     sql           : string;
     error         : out boolean;
     error_message : out us.unbounded_string;
     callback      : exec_callback_t          := null;
     user_data     : user_data_access_type    := null);
  pragma inline (exec);

  procedure close
    (database : sqlite3.types.database_t);
  pragma inline (close);

  function error_message
    (database : sqlite3.types.database_t) return string;
  pragma inline (error_message);

end sqlite3.api;
