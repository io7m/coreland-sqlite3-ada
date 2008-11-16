with cstringa;
with interfaces.c.strings;
with interfaces.c;
with sqlite3.constants;
with sqlite3.thin;

package body sqlite3.api is
  package c renames interfaces.c;
  package cs renames interfaces.c.strings;

  use type cs.chars_ptr;
  use type sqlite3.types.int_t;

  type cbridge_context_t is record
    user_data : user_data_access_type;
    callback  : exec_callback_t;
  end record;
  pragma convention (c, cbridge_context_t);

  function exec_cbridge
    (context       : access cbridge_context_t;
     num_columns   : sqlite3.types.int_t;
     column_values : sqlite3.types.char_2star_t;
     column_names  : sqlite3.types.char_2star_t) return sqlite3.types.int_t;
  pragma convention (c, exec_cbridge);
 
  --
  -- type conversion callback
  --

  function exec_cbridge
    (context       : access cbridge_context_t;
     num_columns   : sqlite3.types.int_t;
     column_values : sqlite3.types.char_2star_t;
     column_names  : sqlite3.types.char_2star_t) return sqlite3.types.int_t
  is
    array_size        : constant natural := natural (num_columns);
    ada_column_values : constant column_values_t :=
      column_values_t (cstringa.convert (pointer => column_values, size => array_size));
    ada_column_names  : constant column_names_t :=
      column_names_t (cstringa.convert (pointer => column_names, size => array_size));
  begin
    -- call Ada callback with new arrays
    context.callback
      (column_names  => ada_column_names,
       column_values => ada_column_values,
       user_data     => context.user_data);
    return 0;
  end exec_cbridge;

  type cbridge_callback_t is access function
    (context       : access cbridge_context_t;
     num_columns   : sqlite3.types.int_t;
     column_values : sqlite3.types.char_2star_t;
     column_names  : sqlite3.types.char_2star_t) return sqlite3.types.int_t;
  pragma convention (c, cbridge_callback_t);

  -- not using the version from the thin binding due to needing
  -- specific user_data and callback types

  function sqlite3_exec
    (database      : sqlite3.types.database_t;
     sql           : cs.chars_ptr;
     callback      : cbridge_callback_t;
     context       : access cbridge_context_t;
     error_message : sqlite3.types.char_2star_t) return sqlite3.types.int_t;
  pragma import (c, sqlite3_exec, "sqlite3_exec");

  procedure sqlite3_free (data : cs.chars_ptr);
  pragma import (c, sqlite3_free, "sqlite3_free");

  --
  -- exec SQL
  -- 

  procedure exec
    (database      : sqlite3.types.database_t;
     sql           : string;
     error         : out boolean;
     error_message : out us.unbounded_string;
     callback      : exec_callback_t           := null;
     user_data     : user_data_access_type     := null)
  is
    -- data to pass to C callback
    c_context : aliased cbridge_context_t :=
      (user_data => user_data,
       callback  => callback);

    -- C string types
    sql_ca    : aliased c.char_array := c.to_c (sql);
    emessage  : aliased cs.chars_ptr;
    error_val : sqlite3.types.int_t;

  begin
    if callback /= null then
      -- call sqlite3_exec with type conversion callback
      error_val := sqlite3_exec
        (database      => database,
         sql           => cs.to_chars_ptr (sql_ca'unchecked_access),
         callback      => exec_cbridge'access,
         context       => c_context'unchecked_access,
         error_message => emessage'address);
    else
      -- don't bother to go to the trouble of type conversion
      error_val := sqlite3.thin.exec
        (db            => database,
         sql           => cs.to_chars_ptr (sql_ca'unchecked_access),
         callback      => null,
         context       => sqlite3.types.null_ptr,
         error_message => emessage'address);
    end if;

    -- convert error message
    if error_val /= sqlite3.constants.sqlite_ok then
      error := true;
      us.set_unbounded_string (error_message, cs.value (emessage));
      sqlite3_free (emessage);
    else
      error := false;
    end if;
  end exec;

  procedure close
    (database : sqlite3.types.database_t)
  is
    ec : constant sqlite3.types.int_t := sqlite3.thin.close
      (sql => database);
  begin
    if ec /= sqlite3.constants.sqlite_ok then
      raise database_error with error_message (database);
    end if;
  end close;

  function sqlite3_open_v2
    (file : cs.chars_ptr;
     db   : access sqlite3.types.database_t;
     mode : mode_t;
     vfs  : cs.chars_ptr := cs.null_ptr) return sqlite3.types.int_t;
  pragma import (c, sqlite3_open_v2, "sqlite3_open_v2");

  procedure open
    (filename : string;
     mode     : mode_t := OPEN_READWRITE or OPEN_CREATE;
     database : out sqlite3.types.database_t)
  is
    fn : aliased c.char_array := c.to_c (filename);
    db : aliased sqlite3.types.database_t;
    ec : constant sqlite3.types.int_t := sqlite3_open_v2
      (file => cs.to_chars_ptr (fn'unchecked_access),
       mode => mode,
       db   => db'unchecked_access);
  begin
    database := db;
    if ec /= sqlite3.constants.sqlite_ok then
      raise database_error with error_message (database);
    end if;
  end open;

  function error_message
    (database : sqlite3.types.database_t) return string is
  begin
    return cs.value (sqlite3.thin.errmsg (database));
  end error_message;

end sqlite3.api;
