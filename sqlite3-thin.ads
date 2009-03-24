with SQLite3.Types;
with Interfaces.C.Strings;

package SQLite3.Thin is
  package CS renames Interfaces.C.Strings;

  function aggregate_context
    (context   : SQLite3.Types.context_t;
     num_bytes : SQLite3.Types.int_t) return SQLite3.Types.void_ptr_t;
  pragma Import (C, aggregate_context, "SQLite3_aggregate_context");

  function auto_extension
    (entry_point : SQLite3.Types.void_ptr_t) return SQLite3.Types.int_t;
  pragma Import (C, auto_extension, "sqlite3_auto_extension");

  function bind_blob
    (stmt       : SQLite3.Types.statement_t;
     index      : SQLite3.Types.int_t;
     blob       : SQLite3.Types.void_ptr_t;
     num_bytes  : SQLite3.Types.int_t;
     destructor : SQLite3.Types.destructor_callback_t) return SQLite3.Types.int_t;
  pragma Import (C, bind_blob, "sqlite3_bind_blob");

  function bind_double
    (stmt  : SQLite3.Types.statement_t;
     index : SQLite3.Types.int_t;
     value : SQLite3.Types.double_t) return SQLite3.Types.int_t;
  pragma Import (C, bind_double, "sqlite3_bind_double");

  function bind_int
    (stmt  : SQLite3.Types.statement_t;
     index : SQLite3.Types.int_t;
     value : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, bind_int, "sqlite3_bind_int");

  function bind_int64
    (stmt  : SQLite3.Types.statement_t;
     index : SQLite3.Types.int_t;
     value : SQLite3.Types.int64_t) return SQLite3.Types.int_t;
  pragma Import (C, bind_int64, "sqlite3_bind_int64");

  function bind_null
    (stmt  : SQLite3.Types.statement_t;
     index : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, bind_null, "sqlite3_bind_null");

  function bind_parameter_count
    (stmt : SQLite3.Types.statement_t;
     num  : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, bind_parameter_count, "sqlite3_bind_parameter_count");

  function bind_parameter_index
    (stmt : SQLite3.Types.statement_t) return SQLite3.Types.int_t;
  pragma Import (C, bind_parameter_index, "sqlite3_bind_parameter_index");

  function bind_parameter_name
    (stmt : SQLite3.Types.statement_t;
     name : CS.chars_ptr) return CS.chars_ptr;
  pragma Import (C, bind_parameter_name, "sqlite3_bind_parameter_name");

  function bind_text
    (stmt       : SQLite3.Types.statement_t;
     index      : SQLite3.Types.int_t;
     blob       : CS.chars_ptr;
     num_bytes  : SQLite3.Types.int_t;
     destructor : SQLite3.Types.destructor_callback_t) return SQLite3.Types.int_t;
  pragma Import (C, bind_text, "sqlite3_bind_text");

  function bind_text16
    (stmt       : SQLite3.Types.statement_t;
     index      : SQLite3.Types.int_t;
     text       : CS.chars_ptr;
     num_bytes  : SQLite3.Types.int_t;
     destructor : SQLite3.Types.destructor_callback_t) return SQLite3.Types.int_t;
  pragma Import (C, bind_text16, "sqlite3_bind_text16");

  function bind_value
    (stmt  : SQLite3.Types.statement_t;
     index : SQLite3.Types.int_t;
     value : SQLite3.Types.value_t) return SQLite3.Types.int_t;
  pragma Import (C, bind_value, "sqlite3_bind_value");

  function bind_zeroblob
    (stmt      : SQLite3.Types.statement_t;
     index     : SQLite3.Types.int_t;
     num_bytes : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, bind_zeroblob, "sqlite3_bind_zeroblob");

  function blob_bytes
    (blob : SQLite3.Types.blob_t) return SQLite3.Types.int_t;
  pragma Import (C, blob_bytes, "sqlite3_blob_bytes");

  function blob_close
    (blob : SQLite3.Types.blob_t) return SQLite3.Types.int_t;
  pragma Import (C, blob_close, "sqlite3_blob_close");

  function blob_open
    (sql    : SQLite3.Types.Database_t;
     db     : CS.chars_ptr;
     table  : CS.chars_ptr;
     column : CS.chars_ptr;
     row    : SQLite3.Types.int64_t;
     flags  : SQLite3.Types.int_t;
     blob   : access SQLite3.Types.blob_t) return SQLite3.Types.int_t;
  pragma Import (C, blob_open, "sqlite3_blob_open");

  function blob_read
    (blob      : SQLite3.Types.blob_t;
     buffer    : SQLite3.Types.void_ptr_t;
     num_bytes : SQLite3.Types.int_t;
     offset    : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, blob_read, "sqlite3_blob_read");

  function blob_write
    (blob      : SQLite3.Types.blob_t;
     buffer    : SQLite3.Types.void_ptr_t;
     num_bytes : SQLite3.Types.int_t;
     offset    : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, blob_write, "sqlite3_blob_write");

  function busy_handler
    (sql      : SQLite3.Types.Database_t;
     callback : SQLite3.Types.busy_callback_t;
     context  : SQLite3.Types.void_ptr_t) return SQLite3.Types.int_t;
  pragma Import (C, busy_handler, "sqlite3_busy_handler");

  function busy_timeout
    (sql : SQLite3.Types.Database_t;
     ms  : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, busy_timeout, "sqlite3_busy_timeout");

  function changes
    (sql : SQLite3.Types.Database_t) return SQLite3.Types.int_t;
  pragma Import (C, changes, "sqlite3_changes");

  function clear_bindings
    (stmt : SQLite3.Types.statement_t) return SQLite3.Types.int_t;
  pragma Import (C, clear_bindings, "sqlite3_clear_bindings");

  function close
    (sql : SQLite3.Types.Database_t) return SQLite3.Types.int_t;
  pragma Import (C, close, "sqlite3_close");

  function collation_needed
    (db       : SQLite3.Types.Database_t;
     context  : SQLite3.Types.void_ptr_t;
     callback : SQLite3.Types.collation_callback_t) return SQLite3.Types.int_t;
  pragma Import (C, collation_needed, "sqlite3_collation_needed");

  function collation_needed16
    (db       : SQLite3.Types.Database_t;
     context  : CS.chars_ptr;
     callback : SQLite3.Types.collation16_callback_t) return SQLite3.Types.int_t;
  pragma Import (C, collation_needed16, "sqlite3_collation_needed16");

  function column_blob
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return SQLite3.Types.void_ptr_t;
  pragma Import (C, column_blob, "sqlite3_column_blob");

  function column_bytes
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, column_bytes, "sqlite3_column_bytes");

  function column_bytes16
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, column_bytes16, "sqlite3_column_bytes16");

  function column_count
    (stmt : SQLite3.Types.statement_t) return SQLite3.Types.int_t;
  pragma Import (C, column_count, "sqlite3_column_count");

  function column_database_name
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return CS.chars_ptr;
  pragma Import (C, column_database_name, "SQLite3_column_database_name");

  function column_database_name16
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return CS.chars_ptr;
  pragma Import (C, column_database_name16, "sqlite3_column_database_name16");

  function column_decltype
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return CS.chars_ptr;
  pragma Import (C, column_decltype, "sqlite3_column_decltype");

  function column_decltype16
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return CS.chars_ptr;
  pragma Import (C, column_decltype16, "sqlite3_column_decltype16");

  function column_double
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return SQLite3.Types.double_t;
  pragma Import (C, column_double, "sqlite3_column_double");

  function column_int
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, column_int, "sqlite3_column_int");

  function column_int64
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return SQLite3.Types.int64_t;
  pragma Import (C, column_int64, "sqlite3_column_int64");

  function column_name
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return CS.chars_ptr;
  pragma Import (C, column_name, "sqlite3_column_name");

  function column_name16
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return CS.chars_ptr;
  pragma Import (C, column_name16, "sqlite3_column_name16");

  function column_origin_name
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return CS.chars_ptr;
  pragma Import (C, column_origin_name, "sqlite3_column_origin_name");

  function column_origin_name16
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return CS.chars_ptr;
  pragma Import (C, column_origin_name16, "sqlite3_column_origin_name16");

  function column_table_name
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return CS.chars_ptr;
  pragma Import (C, column_table_name, "sqlite3_column_table_name");

  function column_table_name16
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return CS.chars_ptr;
  pragma Import (C, column_table_name16, "sqlite3_column_table_name16");

  function column_text
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return CS.chars_ptr;
  pragma Import (C, column_text, "sqlite3_column_text");

  function column_text16
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return CS.chars_ptr;
  pragma Import (C, column_text16, "sqlite3_column_text16");

  function column_type
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, column_type, "sqlite3_column_type");

  function column_value
    (stmt   : SQLite3.Types.statement_t;
     column : SQLite3.Types.int_t) return SQLite3.Types.value_t;
  pragma Import (C, column_value, "sqlite3_column_value");

  function commit_hook
    (sql      : SQLite3.Types.Database_t;
     callback : SQLite3.Types.commit_callback_t;
     context  : SQLite3.Types.void_ptr_t) return SQLite3.Types.void_ptr_t;
  pragma Import (C, commit_hook, "sqlite3_commit_hook");

  function complete
    (sql : SQLite3.Types.Database_t) return SQLite3.Types.int_t;
  pragma Import (C, complete, "sqlite3_complete");

  function complete16
    (sql : SQLite3.Types.Database_t) return SQLite3.Types.int_t;
  pragma Import (C, complete16, "sqlite3_complete16");

  function context_db_handle
    (context : SQLite3.Types.context_t) return SQLite3.Types.Database_t;
  pragma Import (C, context_db_handle, "sqlite3_context_db_handle");

  function create_collation
    (sql      : SQLite3.Types.Database_t;
     name     : CS.chars_ptr;
     encoding : SQLite3.Types.text_encoding_t;
     context  : SQLite3.Types.void_ptr_t;
     callback : SQLite3.Types.compare_callback_t) return SQLite3.Types.int_t;
  pragma Import (C, create_collation, "sqlite3_create_collation");

  function create_collation16
    (sql      : SQLite3.Types.Database_t;
     name     : CS.chars_ptr;
     encoding : SQLite3.Types.text_encoding_t;
     context  : SQLite3.Types.void_ptr_t;
     callback : SQLite3.Types.compare_callback_t) return SQLite3.Types.int_t;
  pragma Import (C, create_collation16, "sqlite3_create_collation16");

  function create_function
    (sql           : SQLite3.Types.Database_t;
     name          : CS.chars_ptr;
     num_arguments : SQLite3.Types.int_t;
     encoding      : SQLite3.Types.text_encoding_t;
     user_data     : SQLite3.Types.void_ptr_t;
     func          : SQLite3.Types.create_func_callback_t;
     step          : SQLite3.Types.create_step_callback_t;
     final         : SQLite3.Types.create_final_callback_t) return SQLite3.Types.int_t;
  pragma Import (C, create_function, "sqlite3_create_function");

  function create_function16
    (sql           : SQLite3.Types.Database_t;
     name          : CS.chars_ptr;
     num_arguments : SQLite3.Types.int_t;
     encoding      : SQLite3.Types.text_encoding_t;
     user_data     : SQLite3.Types.void_ptr_t;
     func          : SQLite3.Types.create_func_callback_t;
     step          : SQLite3.Types.create_step_callback_t;
     final         : SQLite3.Types.create_final_callback_t) return SQLite3.Types.int_t;
  pragma Import (C, create_function16, "sqlite3_create_function16");

  function data_count
    (stmt : SQLite3.Types.statement_t) return SQLite3.Types.int_t;
  pragma Import (C, data_count, "sqlite3_data_count");

  function db_handle
    (stmt : SQLite3.Types.statement_t) return SQLite3.Types.Database_t;
  pragma Import (C, db_handle, "sqlite3_db_handle");

  function enable_load_extension
    (db    : SQLite3.Types.Database_t;
     onoff : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, enable_load_extension, "sqlite3_enable_load_extension");

  function enable_shared_cache
    (onoff : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, enable_shared_cache, "sqlite3_enable_shared_cache");

  function errcode
    (db : SQLite3.Types.Database_t) return SQLite3.Types.int_t;
  pragma Import (C, errcode, "sqlite3_errcode");

  function errmsg
    (db : SQLite3.Types.Database_t) return CS.chars_ptr;
  pragma Import (C, errmsg, "sqlite3_errmsg");

  function errmsg16
    (db : SQLite3.Types.Database_t) return CS.chars_ptr;
  pragma Import (C, errmsg16, "sqlite3_errmsg16");

  function exec
    (db            : SQLite3.Types.Database_t;
     sql           : CS.chars_ptr;
     callback      : SQLite3.Types.exec_callback_t;
     context       : SQLite3.Types.void_ptr_t;
     error_message : SQLite3.Types.char_2star_t) return SQLite3.Types.int_t;
  pragma Import (C, exec, "sqlite3_exec");

  function extended_result_codes
    (db    : SQLite3.Types.Database_t;
     onoff : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, extended_result_codes, "sqlite3_extended_result_codes");

  function file_control
    (db      : SQLite3.Types.Database_t;
     db_name : CS.chars_ptr;
     op      : SQLite3.Types.int_t;
     context : SQLite3.Types.void_ptr_t) return SQLite3.Types.int_t;
  pragma Import (C, file_control, "sqlite3_file_control");

  function finalize
    (stmt : SQLite3.Types.statement_t) return SQLite3.Types.int_t;
  pragma Import (C, finalize, "sqlite3_finalize");

  procedure free
    (address : SQLite3.Types.void_ptr_t);
  pragma Import (C, free, "sqlite3_free");

  procedure free_table
    (table : SQLite3.Types.char_2star_t);
  pragma Import (C, free_table, "sqlite3_free_table");

  function get_autocommit
    (db : SQLite3.Types.Database_t) return SQLite3.Types.int_t;
  pragma Import (C, get_autocommit, "sqlite3_get_autocommit");

  function get_auxdata
    (context : SQLite3.Types.context_t;
     n       : SQLite3.Types.int_t) return SQLite3.Types.void_ptr_t;
  pragma Import (C, get_auxdata, "sqlite3_get_auxdata");

  function get_table
    (db            : SQLite3.Types.Database_t;
     sql           : CS.chars_ptr;
     result        : SQLite3.Types.char_3star_t;
     row           : SQLite3.Types.int_access_t;
     column        : SQLite3.Types.int_access_t;
     error_message : SQLite3.Types.char_2star_t) return SQLite3.Types.int_t;
  pragma Import (C, get_table, "sqlite3_get_table");

  function initialize return SQLite3.Types.int_t;
  pragma Import (C, initialize, "sqlite3_initialize");

  procedure interrupt
    (db : SQLite3.Types.Database_t);
  pragma Import (C, interrupt, "sqlite3_interrupt");

  function last_insert_rowid
    (db : SQLite3.Types.Database_t) return SQLite3.Types.int64_t;
  pragma Import (C, last_insert_rowid, "sqlite3_last_insert_rowid");

  function libversion return CS.chars_ptr;
  pragma Import (C, libversion, "sqlite3_libversion");

  function libversion_number return SQLite3.Types.int_t;
  pragma Import (C, libversion_number, "sqlite3_libversion_number");

  function limit
    (db        : SQLite3.Types.Database_t;
     id        : SQLite3.Types.int_t;
     new_value : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, limit, "sqlite3_limit");

  function load_extension
    (db            : SQLite3.Types.Database_t;
     file          : CS.chars_ptr;
     exten_entry   : CS.chars_ptr;
     error_message : SQLite3.Types.char_2star_t) return SQLite3.Types.int_t;
  pragma Import (C, load_extension, "sqlite3_load_extension");

  function malloc
    (bytes : SQLite3.Types.int_t) return SQLite3.Types.void_ptr_t;
  pragma Import (C, malloc, "sqlite3_malloc");

  function memory_highwater
    (reset_flag : SQLite3.Types.int_t) return SQLite3.Types.int64_t;
  pragma Import (C, memory_highwater, "sqlite3_memory_highwater");

  function memory_used return SQLite3.Types.int64_t;
  pragma Import (C, memory_used, "sqlite3_memory_used");

  function mutex_alloc
    (mutex_type : SQLite3.Types.mutex_type_t) return SQLite3.Types.mutex_t;
  pragma Import (C, mutex_alloc, "sqlite3_mutex_alloc");

  procedure mutex_enter
    (mutex : SQLite3.Types.mutex_t);
  pragma Import (C, mutex_enter, "sqlite3_mutex_enter");

  procedure mutex_free
    (mutex : SQLite3.Types.mutex_t);
  pragma Import (C, mutex_free, "sqlite3_mutex_free");

  function mutex_held
    (mutex : SQLite3.Types.mutex_t) return SQLite3.Types.int_t;
  pragma Import (C, mutex_held, "sqlite3_mutex_held");

  procedure mutex_leave
    (mutex : SQLite3.Types.mutex_t);
  pragma Import (C, mutex_leave, "sqlite3_mutex_leave");

  function mutex_notheld
    (mutex : SQLite3.Types.mutex_t) return SQLite3.Types.int_t;
  pragma Import (C, mutex_notheld, "sqlite3_mutex_notheld");

  function mutex_try
    (mutex : SQLite3.Types.mutex_t) return SQLite3.Types.int_t;
  pragma Import (C, mutex_try, "sqlite3_mutex_try");

  function next_stmt
    (db   : SQLite3.Types.Database_t;
     stmt : SQLite3.Types.statement_t) return SQLite3.Types.statement_t;
  pragma Import (C, next_stmt, "sqlite3_next_stmt");

  function open
    (file : CS.chars_ptr;
     db   : access SQLite3.Types.Database_t) return SQLite3.Types.int_t;
  pragma Import (C, open, "sqlite3_open");

  function open16
    (file : CS.chars_ptr;
     db   : access SQLite3.Types.Database_t) return SQLite3.Types.int_t;
  pragma Import (C, open16, "sqlite3_open16");

  function os_end return SQLite3.Types.int_t;
  pragma Import (C, os_end, "sqlite3_os_end");

  function os_init return SQLite3.Types.int_t;
  pragma Import (C, os_init, "sqlite3_os_init");

  -- "Note that the use of SQLite3_prepare() is not recommended for new
  -- applications. The alternative routine SQLite3_prepare_v2() should be
  -- used instead."

  function prepare
    (db         : SQLite3.Types.Database_t;
     sql        : CS.chars_ptr;
     sql_length : SQLite3.Types.int_t;
     stmt       : access SQLite3.Types.statement_t;
     tail       : SQLite3.Types.char_2star_t) return SQLite3.Types.int_t;
  pragma Import (C, prepare, "sqlite3_prepare_v2");

  function prepare16
    (db         : SQLite3.Types.Database_t;
     sql        : CS.chars_ptr;
     sql_length : SQLite3.Types.int_t;
     stmt       : access SQLite3.Types.statement_t;
     tail       : SQLite3.Types.char_2star_t) return SQLite3.Types.int_t;
  pragma Import (C, prepare16, "sqlite3_prepare16_v2");

  procedure progress_handler
    (db       : SQLite3.Types.Database_t;
     opcodes  : SQLite3.Types.int_t;
     callback : SQLite3.Types.progress_callback_t;
     context  : SQLite3.Types.void_ptr_t);
  pragma Import (C, progress_handler, "sqlite3_progress_handler");

  procedure randomness
    (bytes   : SQLite3.Types.int_t;
     address : SQLite3.Types.void_ptr_t);
  pragma Import (C, randomness, "sqlite3_randomness");

  function realloc
    (address : SQLite3.Types.void_ptr_t;
     size    : SQLite3.Types.int_t) return SQLite3.Types.void_ptr_t;
  pragma Import (C, realloc, "sqlite3_realloc");

  function release_memory
    (flag : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, release_memory, "sqlite3_release_memory");

  function reset
    (stmt : SQLite3.Types.statement_t) return SQLite3.Types.int_t;
  pragma Import (C, reset, "sqlite3_reset");

  procedure reset_auto_extension;
  pragma Import (C, reset_auto_extension, "sqlite3_reset_auto_extension");

  procedure result_blob
    (context   : SQLite3.Types.context_t;
     blob      : SQLite3.Types.void_ptr_t;
     num_bytes : SQLite3.Types.int_t;
     callback  : SQLite3.Types.result_callback_t);
  pragma Import (C, result_blob, "sqlite3_result_blob");

  procedure result_double
    (context : SQLite3.Types.context_t;
     value   : SQLite3.Types.double_t);
  pragma Import (C, result_double, "sqlite3_result_double");

  procedure result_error
    (context   : SQLite3.Types.context_t;
     value     : CS.chars_ptr;
     num_bytes : SQLite3.Types.int_t);
  pragma Import (C, result_error, "sqlite3_result_error");

  procedure result_error16
    (context   : SQLite3.Types.context_t;
     value     : CS.chars_ptr;
     num_bytes : SQLite3.Types.int_t);
  pragma Import (C, result_error16, "sqlite3_result_error16");

  procedure result_error_code
    (context    : SQLite3.Types.context_t;
     error_code : SQLite3.Types.int_t);
  pragma Import (C, result_error_code, "sqlite3_result_error_code");

  procedure result_error_nomem
    (context : SQLite3.Types.context_t);
  pragma Import (C, result_error_nomem, "sqlite3_result_error_nomem");

  procedure result_error_toobig
    (context : SQLite3.Types.context_t);
  pragma Import (C, result_error_toobig, "sqlite3_result_error_toobig");

  procedure result_int
    (context : SQLite3.Types.context_t;
     value   : SQLite3.Types.int_t);
  pragma Import (C, result_int, "sqlite3_result_int");

  procedure result_int64
    (context : SQLite3.Types.context_t;
     value   : SQLite3.Types.int64_t);
  pragma Import (C, result_int64, "sqlite3_result_int64");

  procedure result_null
    (context : SQLite3.Types.context_t);
  pragma Import (C, result_null, "sqlite3_result_null");

  procedure result_text
    (context   : SQLite3.Types.context_t;
     text      : CS.chars_ptr;
     num_bytes : SQLite3.Types.int_t;
     callback  : SQLite3.Types.result_callback_t);
  pragma Import (C, result_text, "sqlite3_result_text");

  procedure result_text16
    (context   : SQLite3.Types.context_t;
     text      : CS.chars_ptr;
     num_bytes : SQLite3.Types.int_t;
     callback  : SQLite3.Types.result_callback_t);
  pragma Import (C, result_text16, "sqlite3_result_text16");

  procedure result_text16be
    (context   : SQLite3.Types.context_t;
     text      : CS.chars_ptr;
     num_bytes : SQLite3.Types.int_t;
     callback  : SQLite3.Types.result_callback_t);
  pragma Import (C, result_text16be, "sqlite3_result_text16be");

  procedure result_text16le
    (context   : SQLite3.Types.context_t;
     text      : CS.chars_ptr;
     num_bytes : SQLite3.Types.int_t;
     callback  : SQLite3.Types.result_callback_t);
  pragma Import (C, result_text16le, "sqlite3_result_text16le");

  procedure result_value
    (context : SQLite3.Types.context_t;
     value   : SQLite3.Types.value_t);
  pragma Import (C, result_value, "sqlite3_result_value");

  procedure result_zeroblob
    (context   : SQLite3.Types.context_t;
     num_bytes : SQLite3.Types.int_t);
  pragma Import (C, result_zeroblob, "sqlite3_result_zeroblob");

  function rollback_hook
    (sql      : SQLite3.Types.Database_t;
     callback : SQLite3.Types.rollback_callback_t;
     context  : SQLite3.Types.void_ptr_t) return SQLite3.Types.void_ptr_t;
  pragma Import (C, rollback_hook, "sqlite3_rollback_hook");

  function set_authorizer
    (db       : SQLite3.Types.Database_t;
     callback : SQLite3.Types.auth_callback_t;
     context  : SQLite3.Types.void_ptr_t) return SQLite3.Types.int_t;
  pragma Import (C, set_authorizer, "sqlite3_set_authorizer");

  function set_auxdata
    (context  : SQLite3.Types.context_t;
     index    : SQLite3.Types.int_t;
     data     : SQLite3.Types.void_ptr_t;
     callback : SQLite3.Types.auxdata_callback_t) return SQLite3.Types.void_ptr_t;
  pragma Import (C, set_auxdata, "sqlite3_set_auxdata");

  function shutdown return SQLite3.Types.int_t;
  pragma Import (C, shutdown, "sqlite3_shutdown");

  function sleep
    (time : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, sleep, "sqlite3_sleep");

  procedure soft_heap_limit
    (limit : SQLite3.Types.int_t);
  pragma Import (C, soft_heap_limit, "sqlite3_soft_heap_limit");

  function sql
    (stmt : SQLite3.Types.statement_t) return CS.chars_ptr;
  pragma Import (C, sql, "sqlite3_sql");

  function step
    (stmt : SQLite3.Types.statement_t) return SQLite3.Types.int_t;
  pragma Import (C, step, "sqlite3_step");

  function table_column_metadata
    (db             : SQLite3.Types.Database_t;
     db_name        : CS.chars_ptr;
     table_name     : CS.chars_ptr;
     column_name    : CS.chars_ptr;
     data_type      : SQLite3.Types.char_2star_t;
     collation_seq  : SQLite3.Types.char_2star_t;
     not_null       : SQLite3.Types.int_access_t;
     primary_key    : SQLite3.Types.int_access_t;
     auto_increment : SQLite3.Types.int_access_t) return SQLite3.Types.int_t;
  pragma Import (C, table_column_metadata, "sqlite3_table_column_metadata");

  function threadsafe return SQLite3.Types.int_t;
  pragma Import (C, threadsafe, "sqlite3_threadsafe");

  function total_changes
    (db : SQLite3.Types.Database_t) return SQLite3.Types.int_t;
  pragma Import (C, total_changes, "sqlite3_total_changes");

  function update_hook
    (db       : SQLite3.Types.Database_t;
     callback : SQLite3.Types.change_callback_t;
     context  : SQLite3.Types.void_ptr_t) return SQLite3.Types.void_ptr_t;
  pragma Import (C, update_hook, "sqlite3_update_hook");

  function user_data
    (context : SQLite3.Types.context_t) return SQLite3.Types.void_ptr_t;
  pragma Import (C, user_data, "sqlite3_user_data");

  function value_blob
    (value : SQLite3.Types.value_t) return SQLite3.Types.void_ptr_t;
  pragma Import (C, value_blob, "sqlite3_value_blob");

  function value_bytes
    (value : SQLite3.Types.value_t) return SQLite3.Types.int_t;
  pragma Import (C, value_bytes, "sqlite3_value_bytes");

  function value_bytes16
    (value : SQLite3.Types.value_t) return SQLite3.Types.int_t;
  pragma Import (C, value_bytes16, "sqlite3_value_bytes16");

  function value_double
    (value : SQLite3.Types.value_t) return SQLite3.Types.double_t;
  pragma Import (C, value_double, "sqlite3_value_double");

  function value_int
    (value : SQLite3.Types.value_t) return SQLite3.Types.int_t;
  pragma Import (C, value_int, "sqlite3_value_int");

  function value_int64
    (value : SQLite3.Types.value_t) return SQLite3.Types.int64_t;
  pragma Import (C, value_int64, "sqlite3_value_int64");

  function value_numeric_type
    (value : SQLite3.Types.value_t) return SQLite3.Types.int_t;
  pragma Import (C, value_numeric_type, "sqlite3_value_numeric_type");

  function value_text
    (value : SQLite3.Types.value_t) return CS.chars_ptr;
  pragma Import (C, value_text, "sqlite3_value_text");

  function value_text16
    (value : SQLite3.Types.value_t) return CS.chars_ptr;
  pragma Import (C, value_text16, "sqlite3_value_text16");

  function value_text16be
    (value : SQLite3.Types.value_t) return CS.chars_ptr;
  pragma Import (C, value_text16be, "sqlite3_value_text16be");

  function value_text16le
    (value : SQLite3.Types.value_t) return CS.chars_ptr;
  pragma Import (C, value_text16le, "sqlite3_value_text16le");

  function value_type
    (value : SQLite3.Types.value_t) return SQLite3.Types.int_t;
  pragma Import (C, value_type, "sqlite3_value_type");

  function vfs_find
    (name : CS.chars_ptr) return SQLite3.Types.vfs_t;
  pragma Import (C, vfs_find, "sqlite3_vfs_find");

  function vfs_register
    (vfs          : SQLite3.Types.vfs_t;
     make_default : SQLite3.Types.int_t) return SQLite3.Types.int_t;
  pragma Import (C, vfs_register, "sqlite3_vfs_register");

  function vfs_unregister
    (vfs : SQLite3.Types.vfs_t) return SQLite3.Types.int_t;
  pragma Import (C, vfs_unregister, "sqlite3_vfs_unregister");

end SQLite3.Thin;
