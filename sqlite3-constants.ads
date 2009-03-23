package SQLite3.Constants is

  SQLITE_OK                       : constant := 0;  -- Successful result 
  SQLITE_ERROR                    : constant := 1;  -- SQL error or missing database 
  SQLITE_INTERNAL                 : constant := 2;  -- NOT USED. Internal logic error in SQLite 
  SQLITE_PERM                     : constant := 3;  -- Access permission denied 
  SQLITE_ABORT                    : constant := 4;  -- Callback routine requested an abort 
  SQLITE_BUSY                     : constant := 5;  -- The database file is locked 
  SQLITE_LOCKED                   : constant := 6;  -- A table in the database is locked 
  SQLITE_NOMEM                    : constant := 7;  -- A malloc() failed 
  SQLITE_READONLY                 : constant := 8;  -- Attempt to write a readonly database 
  SQLITE_INTERRUPT                : constant := 9;  -- Operation terminated by SQLite3_interrupt()
  SQLITE_IOERR                    : constant := 10;  -- Some kind of disk I/O error occurred 
  SQLITE_CORRUPT                  : constant := 11;  -- The database disk image is malformed 
  SQLITE_NOTFOUND                 : constant := 12;  -- NOT USED. Table or record not found 
  SQLITE_FULL                     : constant := 13;  -- Insertion failed because database is full 
  SQLITE_CANTOPEN                 : constant := 14;  -- Unable to open the database file 
  SQLITE_PROTOCOL                 : constant := 15;  -- NOT USED. Database lock protocol error 
  SQLITE_EMPTY                    : constant := 16;  -- Database is empty 
  SQLITE_SCHEMA                   : constant := 17;  -- The database schema changed 
  SQLITE_TOOBIG                   : constant := 18;  -- String or BLOB exceeds size limit 
  SQLITE_CONSTRAINT               : constant := 19;  -- Abort due to contraint violation 
  SQLITE_MISMATCH                 : constant := 20;  -- Data type mismatch 
  SQLITE_MISUSE                   : constant := 21;  -- Library used incorrectly 
  SQLITE_NOLFS                    : constant := 22;  -- Uses OS features not supported on host 
  SQLITE_AUTH                     : constant := 23;  -- Authorization denied 
  SQLITE_FORMAT                   : constant := 24;  -- Auxiliary database format error 
  SQLITE_RANGE                    : constant := 25;  -- 2nd parameter to SQLite3_bind out of range 
  SQLITE_NOTADB                   : constant := 26;  -- File opened that is not a database file 
  SQLITE_ROW                      : constant := 100; -- SQLite3_step() has another row ready 
  SQLITE_DONE                     : constant := 101; -- SQLite3_step() has finished executing 
  SQLITE_IOERR_READ               : constant := 2#00000001_00001010#;
  SQLITE_IOERR_SHORT_READ         : constant := 2#00000010_00001010#;
  SQLITE_IOERR_WRITE              : constant := 2#00000011_00001010#;
  SQLITE_IOERR_FSYNC              : constant := 2#00000100_00001010#;
  SQLITE_IOERR_DIR_FSYNC          : constant := 2#00000101_00001010#;
  SQLITE_IOERR_TRUNCATE           : constant := 2#00000110_00001010#;
  SQLITE_IOERR_FSTAT              : constant := 2#00000111_00001010#;
  SQLITE_IOERR_UNLOCK             : constant := 2#00001000_00001010#;
  SQLITE_IOERR_RDLOCK             : constant := 2#00001001_00001010#;
  SQLITE_IOERR_DELETE             : constant := 2#00001010_00001010#;
  SQLITE_IOERR_BLOCKED            : constant := 2#00001011_00001010#;
  SQLITE_DENY                     : constant := 1;  -- Abort the SQL statement with an error 
  SQLITE_IGNORE                   : constant := 2;  -- Don't allow access, but don't generate an error 
  SQLITE_CREATE_INDEX             : constant := 1;  -- Index Name      Table Name      
  SQLITE_CREATE_TABLE             : constant := 2;  -- Table Name      NULL            
  SQLITE_CREATE_TEMP_INDEX        : constant := 3;  -- Index Name      Table Name      
  SQLITE_CREATE_TEMP_TABLE        : constant := 4;  -- Table Name      NULL            
  SQLITE_CREATE_TEMP_TRIGGER      : constant := 5;  -- Trigger Name    Table Name      
  SQLITE_CREATE_TEMP_VIEW         : constant := 6;  -- View Name       NULL            
  SQLITE_CREATE_TRIGGER           : constant := 7;  -- Trigger Name    Table Name      
  SQLITE_CREATE_VIEW              : constant := 8;  -- View Name       NULL            
  SQLITE_DELETE                   : constant := 9;  -- Table Name      NULL            
  SQLITE_DROP_INDEX               : constant := 10;  -- Index Name      Table Name      
  SQLITE_DROP_TABLE               : constant := 11;  -- Table Name      NULL            
  SQLITE_DROP_TEMP_INDEX          : constant := 12;  -- Index Name      Table Name      
  SQLITE_DROP_TEMP_TABLE          : constant := 13;  -- Table Name      NULL            
  SQLITE_DROP_TEMP_TRIGGER        : constant := 14;  -- Trigger Name    Table Name      
  SQLITE_DROP_TEMP_VIEW           : constant := 15;  -- View Name       NULL            
  SQLITE_DROP_TRIGGER             : constant := 16;  -- Trigger Name    Table Name      
  SQLITE_DROP_VIEW                : constant := 17;  -- View Name       NULL            
  SQLITE_INSERT                   : constant := 18;  -- Table Name      NULL            
  SQLITE_PRAGMA                   : constant := 19;  -- Pragma Name     1st arg or NULL 
  SQLITE_READ                     : constant := 20;  -- Table Name      Column Name     
  SQLITE_SELECT                   : constant := 21;  -- NULL            NULL            
  SQLITE_TRANSACTION              : constant := 22;  -- NULL            NULL            
  SQLITE_UPDATE                   : constant := 23;  -- Table Name      Column Name     
  SQLITE_ATTACH                   : constant := 24;  -- Filename        NULL            
  SQLITE_DETACH                   : constant := 25;  -- Database Name   NULL            
  SQLITE_ALTER_TABLE              : constant := 26;  -- Database Name   Table Name      
  SQLITE_REINDEX                  : constant := 27;  -- Index Name      NULL            
  SQLITE_ANALYZE                  : constant := 28;  -- Table Name      NULL            
  SQLITE_CREATE_VTABLE            : constant := 29;  -- Table Name      Module Name     
  SQLITE_DROP_VTABLE              : constant := 30;  -- Table Name      Module Name     
  SQLITE_FUNCTION                 : constant := 31;  -- Function Name   NULL            
  SQLITE_COPY                     : constant := 0;  -- No longer used 
  SQLITE_INTEGER                  : constant := 1;
  SQLITE_FLOAT                    : constant := 2;
  SQLITE_BLOB                     : constant := 4;
  SQLITE_NULL                     : constant := 5;
  SQLITE_TEXT                     : constant := 3;
  SQLITE_STATIC                   : constant := 0;
  SQLITE_TRANSIENT                : constant := -1;
  SQLITE_INDEX_CONSTRAINT_EQ      : constant := 2;
  SQLITE_INDEX_CONSTRAINT_GT      : constant := 4;
  SQLITE_INDEX_CONSTRAINT_LE      : constant := 8;
  SQLITE_INDEX_CONSTRAINT_LT      : constant := 16;
  SQLITE_INDEX_CONSTRAINT_GE      : constant := 32;
  SQLITE_INDEX_CONSTRAINT_MATCH   : constant := 64;

end SQLite3.constants;
