with SQLite3.types;
with interfaces.c.strings;

package SQLite3.Thin is
  package CS renames interfaces.c.strings;

  function aggregate_context
    (context   : SQLite3.types.context_t;
     num_bytes : SQLite3.types.int_t) return SQLite3.types.void_ptr_t;
  pragma import (c, aggregate_context, "SQLite3_aggregate_context");

  function auto_extension
    (entry_point : SQLite3.types.void_ptr_t) return SQLite3.types.int_t;
  pragma import (c, auto_extension, "sqlite3_auto_extension");

  function bind_blob
    (stmt       : SQLite3.types.statement_t;
     index      : SQLite3.types.int_t;
     blob       : SQLite3.types.void_ptr_t;
     num_bytes  : SQLite3.types.int_t;
     destructor : SQLite3.types.destructor_callback_t) return SQLite3.types.int_t;
  pragma import (c, bind_blob, "sqlite3_bind_blob");

  function bind_double
    (stmt  : SQLite3.types.statement_t;
     index : SQLite3.types.int_t;
     value : SQLite3.types.double_t) return SQLite3.types.int_t;
  pragma import (c, bind_double, "sqlite3_bind_double");

  function bind_int
    (stmt  : SQLite3.types.statement_t;
     index : SQLite3.types.int_t;
     value : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, bind_int, "sqlite3_bind_int");

  function bind_int64
    (stmt  : SQLite3.types.statement_t;
     index : SQLite3.types.int_t;
     value : SQLite3.types.int64_t) return SQLite3.types.int_t;
  pragma import (c, bind_int64, "sqlite3_bind_int64");

  function bind_null
    (stmt  : SQLite3.types.statement_t;
     index : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, bind_null, "sqlite3_bind_null");

  function bind_parameter_count
    (stmt : SQLite3.types.statement_t;
     num  : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, bind_parameter_count, "sqlite3_bind_parameter_count");

  function bind_parameter_index
    (stmt : SQLite3.types.statement_t) return SQLite3.types.int_t;
  pragma import (c, bind_parameter_index, "sqlite3_bind_parameter_index");

  function bind_parameter_name
    (stmt : SQLite3.types.statement_t;
     name : cs.chars_ptr) return cs.chars_ptr;
  pragma import (c, bind_parameter_name, "sqlite3_bind_parameter_name");

  function bind_text
    (stmt       : SQLite3.types.statement_t;
     index      : SQLite3.types.int_t;
     blob       : cs.chars_ptr;
     num_bytes  : SQLite3.types.int_t;
     destructor : SQLite3.types.destructor_callback_t) return SQLite3.types.int_t;
  pragma import (c, bind_text, "sqlite3_bind_text");

  function bind_text16
    (stmt       : SQLite3.types.statement_t;
     index      : SQLite3.types.int_t;
     text       : cs.chars_ptr;
     num_bytes  : SQLite3.types.int_t;
     destructor : SQLite3.types.destructor_callback_t) return SQLite3.types.int_t;
  pragma import (c, bind_text16, "sqlite3_bind_text16");

  function bind_value
    (stmt  : SQLite3.types.statement_t;
     index : SQLite3.types.int_t;
     value : SQLite3.types.value_t) return SQLite3.types.int_t;
  pragma import (c, bind_value, "sqlite3_bind_value");

  function bind_zeroblob
    (stmt      : SQLite3.types.statement_t;
     index     : SQLite3.types.int_t;
     num_bytes : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, bind_zeroblob, "sqlite3_bind_zeroblob");

  function blob_bytes
    (blob : SQLite3.types.blob_t) return SQLite3.types.int_t;
  pragma import (c, blob_bytes, "sqlite3_blob_bytes");

  function blob_close
    (blob : SQLite3.types.blob_t) return SQLite3.types.int_t;
  pragma import (c, blob_close, "sqlite3_blob_close");

  function blob_open
    (sql    : SQLite3.types.database_t;
     db     : cs.chars_ptr;
     table  : cs.chars_ptr;
     column : cs.chars_ptr;
     row    : SQLite3.types.int64_t;
     flags  : SQLite3.types.int_t;
     blob   : access SQLite3.types.blob_t) return SQLite3.types.int_t;
  pragma import (c, blob_open, "sqlite3_blob_open");

  function blob_read
    (blob      : SQLite3.types.blob_t;
     buffer    : SQLite3.types.void_ptr_t;
     num_bytes : SQLite3.types.int_t;
     offset    : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, blob_read, "sqlite3_blob_read");

  function blob_write
    (blob      : SQLite3.types.blob_t;
     buffer    : SQLite3.types.void_ptr_t;
     num_bytes : SQLite3.types.int_t;
     offset    : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, blob_write, "sqlite3_blob_write");

  function busy_handler
    (sql      : SQLite3.types.database_t;
     callback : SQLite3.types.busy_callback_t;
     context  : SQLite3.types.void_ptr_t) return SQLite3.types.int_t;
  pragma import (c, busy_handler, "sqlite3_busy_handler");

  function busy_timeout
    (sql : SQLite3.types.database_t;
     ms  : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, busy_timeout, "sqlite3_busy_timeout");

  function changes
    (sql : SQLite3.types.database_t) return SQLite3.types.int_t;
  pragma import (c, changes, "sqlite3_changes");

  function clear_bindings
    (stmt : SQLite3.types.statement_t) return SQLite3.types.int_t;
  pragma import (c, clear_bindings, "sqlite3_clear_bindings");

  function close
    (sql : SQLite3.types.database_t) return SQLite3.types.int_t;
  pragma import (c, close, "sqlite3_close");

  function collation_needed
    (db       : SQLite3.types.database_t;
     context  : SQLite3.types.void_ptr_t;
     callback : SQLite3.types.collation_callback_t) return SQLite3.types.int_t;
  pragma import (c, collation_needed, "sqlite3_collation_needed");

  function collation_needed16
    (db       : SQLite3.types.database_t;
     context  : cs.chars_ptr;
     callback : SQLite3.types.collation16_callback_t) return SQLite3.types.int_t;
  pragma import (c, collation_needed16, "sqlite3_collation_needed16");

  function column_blob
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return SQLite3.types.void_ptr_t;
  pragma import (c, column_blob, "sqlite3_column_blob");

  function column_bytes
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, column_bytes, "sqlite3_column_bytes");

  function column_bytes16
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, column_bytes16, "sqlite3_column_bytes16");

  function column_count
    (stmt : SQLite3.types.statement_t) return SQLite3.types.int_t;
  pragma import (c, column_count, "sqlite3_column_count");

  function column_database_name
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_database_name, "SQLite3_column_database_name");

  function column_database_name16
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_database_name16, "sqlite3_column_database_name16");

  function column_decltype
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_decltype, "sqlite3_column_decltype");

  function column_decltype16
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_decltype16, "sqlite3_column_decltype16");

  function column_double
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return SQLite3.types.double_t;
  pragma import (c, column_double, "sqlite3_column_double");

  function column_int
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, column_int, "sqlite3_column_int");

  function column_int64
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return SQLite3.types.int64_t;
  pragma import (c, column_int64, "sqlite3_column_int64");

  function column_name
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_name, "sqlite3_column_name");

  function column_name16
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_name16, "sqlite3_column_name16");

  function column_origin_name
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_origin_name, "sqlite3_column_origin_name");

  function column_origin_name16
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_origin_name16, "sqlite3_column_origin_name16");

  function column_table_name
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_table_name, "sqlite3_column_table_name");

  function column_table_name16
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_table_name16, "sqlite3_column_table_name16");

  function column_text
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_text, "sqlite3_column_text");

  function column_text16
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_text16, "sqlite3_column_text16");

  function column_type
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, column_type, "sqlite3_column_type");

  function column_value
    (stmt   : SQLite3.types.statement_t;
     column : SQLite3.types.int_t) return SQLite3.types.value_t;
  pragma import (c, column_value, "sqlite3_column_value");

  function commit_hook
    (sql      : SQLite3.types.database_t;
     callback : SQLite3.types.commit_callback_t;
     context  : SQLite3.types.void_ptr_t) return SQLite3.types.void_ptr_t;
  pragma import (c, commit_hook, "sqlite3_commit_hook");

  function complete
    (sql : SQLite3.types.database_t) return SQLite3.types.int_t;
  pragma import (c, complete, "sqlite3_complete");

  function complete16
    (sql : SQLite3.types.database_t) return SQLite3.types.int_t;
  pragma import (c, complete16, "sqlite3_complete16");

  function context_db_handle
    (context : SQLite3.types.context_t) return SQLite3.types.database_t;
  pragma import (c, context_db_handle, "sqlite3_context_db_handle");

  function create_collation
    (sql      : SQLite3.types.database_t;
     name     : cs.chars_ptr;
     encoding : SQLite3.types.text_encoding_t;
     context  : SQLite3.types.void_ptr_t;
     callback : SQLite3.types.compare_callback_t) return SQLite3.types.int_t;
  pragma import (c, create_collation, "sqlite3_create_collation");

  function create_collation16
    (sql      : SQLite3.types.database_t;
     name     : cs.chars_ptr;
     encoding : SQLite3.types.text_encoding_t;
     context  : SQLite3.types.void_ptr_t;
     callback : SQLite3.types.compare_callback_t) return SQLite3.types.int_t;
  pragma import (c, create_collation16, "sqlite3_create_collation16");

  function create_function
    (sql           : SQLite3.types.database_t;
     name          : cs.chars_ptr;
     num_arguments : SQLite3.types.int_t;
     encoding      : SQLite3.types.text_encoding_t;
     user_data     : SQLite3.types.void_ptr_t;
     func          : SQLite3.types.create_func_callback_t;
     step          : SQLite3.types.create_step_callback_t;
     final         : SQLite3.types.create_final_callback_t) return SQLite3.types.int_t;
  pragma import (c, create_function, "sqlite3_create_function");

  function create_function16
    (sql           : SQLite3.types.database_t;
     name          : cs.chars_ptr;
     num_arguments : SQLite3.types.int_t;
     encoding      : SQLite3.types.text_encoding_t;
     user_data     : SQLite3.types.void_ptr_t;
     func          : SQLite3.types.create_func_callback_t;
     step          : SQLite3.types.create_step_callback_t;
     final         : SQLite3.types.create_final_callback_t) return SQLite3.types.int_t;
  pragma import (c, create_function16, "sqlite3_create_function16");

  function data_count
    (stmt : SQLite3.types.statement_t) return SQLite3.types.int_t;
  pragma import (c, data_count, "sqlite3_data_count");

  function db_handle
    (stmt : SQLite3.types.statement_t) return SQLite3.types.database_t;
  pragma import (c, db_handle, "sqlite3_db_handle");

  function enable_load_extension
    (db    : SQLite3.types.database_t;
     onoff : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, enable_load_extension, "sqlite3_enable_load_extension");

  function enable_shared_cache
    (onoff : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, enable_shared_cache, "sqlite3_enable_shared_cache");

  function errcode
    (db : SQLite3.types.database_t) return SQLite3.types.int_t;
  pragma import (c, errcode, "sqlite3_errcode");

  function errmsg
    (db : SQLite3.types.database_t) return cs.chars_ptr;
  pragma import (c, errmsg, "sqlite3_errmsg");

  function errmsg16
    (db : SQLite3.types.database_t) return cs.chars_ptr;
  pragma import (c, errmsg16, "sqlite3_errmsg16");

  function exec
    (db            : SQLite3.types.database_t;
     sql           : cs.chars_ptr;
     callback      : SQLite3.types.exec_callback_t;
     context       : SQLite3.types.void_ptr_t;
     error_message : SQLite3.types.char_2star_t) return SQLite3.types.int_t;
  pragma import (c, exec, "sqlite3_exec");

  function extended_result_codes
    (db    : SQLite3.types.database_t;
     onoff : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, extended_result_codes, "sqlite3_extended_result_codes");

  function file_control
    (db      : SQLite3.types.database_t;
     db_name : cs.chars_ptr;
     op      : SQLite3.types.int_t;
     context : SQLite3.types.void_ptr_t) return SQLite3.types.int_t;
  pragma import (c, file_control, "sqlite3_file_control");

  function finalize
    (stmt : SQLite3.types.statement_t) return SQLite3.types.int_t;
  pragma import (c, finalize, "sqlite3_finalize");

  procedure free
    (address : SQLite3.types.void_ptr_t);
  pragma import (c, free, "sqlite3_free");

  procedure free_table
    (table : SQLite3.types.char_2star_t);
  pragma import (c, free_table, "sqlite3_free_table");

  function get_autocommit
    (db : SQLite3.types.database_t) return SQLite3.types.int_t;
  pragma import (c, get_autocommit, "sqlite3_get_autocommit");

  function get_auxdata
    (context : SQLite3.types.context_t;
     n       : SQLite3.types.int_t) return SQLite3.types.void_ptr_t;
  pragma import (c, get_auxdata, "sqlite3_get_auxdata");

  function get_table
    (db            : SQLite3.types.database_t;
     sql           : cs.chars_ptr;
     result        : SQLite3.types.char_3star_t;
     row           : SQLite3.types.int_access_t;
     column        : SQLite3.types.int_access_t;
     error_message : SQLite3.types.char_2star_t) return SQLite3.types.int_t;
  pragma import (c, get_table, "sqlite3_get_table");

  function initialize return SQLite3.types.int_t;
  pragma import (c, initialize, "sqlite3_initialize");

  procedure interrupt
    (db : SQLite3.types.database_t);
  pragma import (c, interrupt, "sqlite3_interrupt");

  function last_insert_rowid
    (db : SQLite3.types.database_t) return SQLite3.types.int64_t;
  pragma import (c, last_insert_rowid, "sqlite3_last_insert_rowid");

  function libversion return cs.chars_ptr;
  pragma import (c, libversion, "sqlite3_libversion");

  function libversion_number return SQLite3.types.int_t;
  pragma import (c, libversion_number, "sqlite3_libversion_number");

  function limit
    (db        : SQLite3.types.database_t;
     id        : SQLite3.types.int_t;
     new_value : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, limit, "sqlite3_limit");

  function load_extension
    (db            : SQLite3.types.database_t;
     file          : cs.chars_ptr;
     exten_entry   : cs.chars_ptr;
     error_message : SQLite3.types.char_2star_t) return SQLite3.types.int_t;
  pragma import (c, load_extension, "sqlite3_load_extension");

  function malloc
    (bytes : SQLite3.types.int_t) return SQLite3.types.void_ptr_t;
  pragma import (c, malloc, "sqlite3_malloc");

  function memory_highwater
    (reset_flag : SQLite3.types.int_t) return SQLite3.types.int64_t;
  pragma import (c, memory_highwater, "sqlite3_memory_highwater");

  function memory_used return SQLite3.types.int64_t;
  pragma import (c, memory_used, "sqlite3_memory_used");

  function mutex_alloc
    (mutex_type : SQLite3.types.mutex_type_t) return SQLite3.types.mutex_t;
  pragma import (c, mutex_alloc, "sqlite3_mutex_alloc");

  procedure mutex_enter
    (mutex : SQLite3.types.mutex_t);
  pragma import (c, mutex_enter, "sqlite3_mutex_enter");

  procedure mutex_free
    (mutex : SQLite3.types.mutex_t);
  pragma import (c, mutex_free, "sqlite3_mutex_free");

  function mutex_held
    (mutex : SQLite3.types.mutex_t) return SQLite3.types.int_t;
  pragma import (c, mutex_held, "sqlite3_mutex_held");

  procedure mutex_leave
    (mutex : SQLite3.types.mutex_t);
  pragma import (c, mutex_leave, "sqlite3_mutex_leave");

  function mutex_notheld
    (mutex : SQLite3.types.mutex_t) return SQLite3.types.int_t;
  pragma import (c, mutex_notheld, "sqlite3_mutex_notheld");

  function mutex_try
    (mutex : SQLite3.types.mutex_t) return SQLite3.types.int_t;
  pragma import (c, mutex_try, "sqlite3_mutex_try");

  function next_stmt
    (db   : SQLite3.types.database_t;
     stmt : SQLite3.types.statement_t) return SQLite3.types.statement_t;
  pragma import (c, next_stmt, "sqlite3_next_stmt");

  function open
    (file : cs.chars_ptr;
     db   : access SQLite3.types.database_t) return SQLite3.types.int_t;
  pragma import (c, open, "sqlite3_open");

  function open16
    (file : cs.chars_ptr;
     db   : access SQLite3.types.database_t) return SQLite3.types.int_t;
  pragma import (c, open16, "sqlite3_open16");

  function os_end return SQLite3.types.int_t;
  pragma import (c, os_end, "sqlite3_os_end");

  function os_init return SQLite3.types.int_t;
  pragma import (c, os_init, "sqlite3_os_init");

  -- "Note that the use of SQLite3_prepare() is not recommended for new
  -- applications. The alternative routine SQLite3_prepare_v2() should be
  -- used instead."

  function prepare
    (db         : SQLite3.types.database_t;
     sql        : cs.chars_ptr;
     sql_length : SQLite3.types.int_t;
     stmt       : access SQLite3.types.statement_t;
     tail       : SQLite3.types.char_2star_t) return SQLite3.types.int_t;
  pragma import (c, prepare, "sqlite3_prepare_v2");

  function prepare16
    (db         : SQLite3.types.database_t;
     sql        : cs.chars_ptr;
     sql_length : SQLite3.types.int_t;
     stmt       : access SQLite3.types.statement_t;
     tail       : SQLite3.types.char_2star_t) return SQLite3.types.int_t;
  pragma import (c, prepare16, "sqlite3_prepare16_v2");

  procedure progress_handler
    (db       : SQLite3.types.database_t;
     opcodes  : SQLite3.types.int_t;
     callback : SQLite3.types.progress_callback_t;
     context  : SQLite3.types.void_ptr_t);
  pragma import (c, progress_handler, "sqlite3_progress_handler");

  procedure randomness
    (bytes   : SQLite3.types.int_t;
     address : SQLite3.types.void_ptr_t);
  pragma import (c, randomness, "sqlite3_randomness");

  function realloc
    (address : SQLite3.types.void_ptr_t;
     size    : SQLite3.types.int_t) return SQLite3.types.void_ptr_t;
  pragma import (c, realloc, "sqlite3_realloc");

  function release_memory
    (flag : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, release_memory, "sqlite3_release_memory");

  function reset
    (stmt : SQLite3.types.statement_t) return SQLite3.types.int_t;
  pragma import (c, reset, "sqlite3_reset");

  procedure reset_auto_extension;
  pragma import (c, reset_auto_extension, "sqlite3_reset_auto_extension");

  procedure result_blob
    (context   : SQLite3.types.context_t;
     blob      : SQLite3.types.void_ptr_t;
     num_bytes : SQLite3.types.int_t;
     callback  : SQLite3.types.result_callback_t);
  pragma import (c, result_blob, "sqlite3_result_blob");

  procedure result_double
    (context : SQLite3.types.context_t;
     value   : SQLite3.types.double_t);
  pragma import (c, result_double, "sqlite3_result_double");

  procedure result_error
    (context   : SQLite3.types.context_t;
     value     : cs.chars_ptr;
     num_bytes : SQLite3.types.int_t);
  pragma import (c, result_error, "sqlite3_result_error");

  procedure result_error16
    (context   : SQLite3.types.context_t;
     value     : cs.chars_ptr;
     num_bytes : SQLite3.types.int_t);
  pragma import (c, result_error16, "sqlite3_result_error16");

  procedure result_error_code
    (context    : SQLite3.types.context_t;
     error_code : SQLite3.types.int_t);
  pragma import (c, result_error_code, "sqlite3_result_error_code");

  procedure result_error_nomem
    (context : SQLite3.types.context_t);
  pragma import (c, result_error_nomem, "sqlite3_result_error_nomem");

  procedure result_error_toobig
    (context : SQLite3.types.context_t);
  pragma import (c, result_error_toobig, "sqlite3_result_error_toobig");

  procedure result_int
    (context : SQLite3.types.context_t;
     value   : SQLite3.types.int_t);
  pragma import (c, result_int, "sqlite3_result_int");

  procedure result_int64
    (context : SQLite3.types.context_t;
     value   : SQLite3.types.int64_t);
  pragma import (c, result_int64, "sqlite3_result_int64");

  procedure result_null
    (context : SQLite3.types.context_t);
  pragma import (c, result_null, "sqlite3_result_null");

  procedure result_text
    (context   : SQLite3.types.context_t;
     text      : cs.chars_ptr;
     num_bytes : SQLite3.types.int_t;
     callback  : SQLite3.types.result_callback_t);
  pragma import (c, result_text, "sqlite3_result_text");

  procedure result_text16
    (context   : SQLite3.types.context_t;
     text      : cs.chars_ptr;
     num_bytes : SQLite3.types.int_t;
     callback  : SQLite3.types.result_callback_t);
  pragma import (c, result_text16, "sqlite3_result_text16");

  procedure result_text16be
    (context   : SQLite3.types.context_t;
     text      : cs.chars_ptr;
     num_bytes : SQLite3.types.int_t;
     callback  : SQLite3.types.result_callback_t);
  pragma import (c, result_text16be, "sqlite3_result_text16be");

  procedure result_text16le
    (context   : SQLite3.types.context_t;
     text      : cs.chars_ptr;
     num_bytes : SQLite3.types.int_t;
     callback  : SQLite3.types.result_callback_t);
  pragma import (c, result_text16le, "sqlite3_result_text16le");

  procedure result_value
    (context : SQLite3.types.context_t;
     value   : SQLite3.types.value_t);
  pragma import (c, result_value, "sqlite3_result_value");

  procedure result_zeroblob
    (context   : SQLite3.types.context_t;
     num_bytes : SQLite3.types.int_t);
  pragma import (c, result_zeroblob, "sqlite3_result_zeroblob");

  function rollback_hook
    (sql      : SQLite3.types.database_t;
     callback : SQLite3.types.rollback_callback_t;
     context  : SQLite3.types.void_ptr_t) return SQLite3.types.void_ptr_t;
  pragma import (c, rollback_hook, "sqlite3_rollback_hook");

  function set_authorizer
    (db       : SQLite3.types.database_t;
     callback : SQLite3.types.auth_callback_t;
     context  : SQLite3.types.void_ptr_t) return SQLite3.types.int_t;
  pragma import (c, set_authorizer, "sqlite3_set_authorizer");

  function set_auxdata
    (context  : SQLite3.types.context_t;
     index    : SQLite3.types.int_t;
     data     : SQLite3.types.void_ptr_t;
     callback : SQLite3.types.auxdata_callback_t) return SQLite3.types.void_ptr_t;
  pragma import (c, set_auxdata, "sqlite3_set_auxdata");

  function shutdown return SQLite3.types.int_t;
  pragma import (c, shutdown, "sqlite3_shutdown");

  function sleep
    (time : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, sleep, "sqlite3_sleep");

  procedure soft_heap_limit
    (limit : SQLite3.types.int_t);
  pragma import (c, soft_heap_limit, "sqlite3_soft_heap_limit");

  function sql
    (stmt : SQLite3.types.statement_t) return cs.chars_ptr;
  pragma import (c, sql, "sqlite3_sql");

  function step
    (stmt : SQLite3.types.statement_t) return SQLite3.types.int_t;
  pragma import (c, step, "sqlite3_step");

  function table_column_metadata
    (db             : SQLite3.types.database_t;
     db_name        : cs.chars_ptr;
     table_name     : cs.chars_ptr;
     column_name    : cs.chars_ptr;
     data_type      : SQLite3.types.char_2star_t;
     collation_seq  : SQLite3.types.char_2star_t;
     not_null       : SQLite3.types.int_access_t;
     primary_key    : SQLite3.types.int_access_t;
     auto_increment : SQLite3.types.int_access_t) return SQLite3.types.int_t;
  pragma import (c, table_column_metadata, "sqlite3_table_column_metadata");

  function threadsafe return SQLite3.types.int_t;
  pragma import (c, threadsafe, "sqlite3_threadsafe");

  function total_changes
    (db : SQLite3.types.database_t) return SQLite3.types.int_t;
  pragma import (c, total_changes, "sqlite3_total_changes");

  function update_hook
    (db       : SQLite3.types.database_t;
     callback : SQLite3.types.change_callback_t;
     context  : SQLite3.types.void_ptr_t) return SQLite3.types.void_ptr_t;
  pragma import (c, update_hook, "sqlite3_update_hook");

  function user_data
    (context : SQLite3.types.context_t) return SQLite3.types.void_ptr_t;
  pragma import (c, user_data, "sqlite3_user_data");

  function value_blob
    (value : SQLite3.types.value_t) return SQLite3.types.void_ptr_t;
  pragma import (c, value_blob, "sqlite3_value_blob");

  function value_bytes
    (value : SQLite3.types.value_t) return SQLite3.types.int_t;
  pragma import (c, value_bytes, "sqlite3_value_bytes");

  function value_bytes16
    (value : SQLite3.types.value_t) return SQLite3.types.int_t;
  pragma import (c, value_bytes16, "sqlite3_value_bytes16");

  function value_double
    (value : SQLite3.types.value_t) return SQLite3.types.double_t;
  pragma import (c, value_double, "sqlite3_value_double");

  function value_int
    (value : SQLite3.types.value_t) return SQLite3.types.int_t;
  pragma import (c, value_int, "sqlite3_value_int");

  function value_int64
    (value : SQLite3.types.value_t) return SQLite3.types.int64_t;
  pragma import (c, value_int64, "sqlite3_value_int64");

  function value_numeric_type
    (value : SQLite3.types.value_t) return SQLite3.types.int_t;
  pragma import (c, value_numeric_type, "sqlite3_value_numeric_type");

  function value_text
    (value : SQLite3.types.value_t) return cs.chars_ptr;
  pragma import (c, value_text, "sqlite3_value_text");

  function value_text16
    (value : SQLite3.types.value_t) return cs.chars_ptr;
  pragma import (c, value_text16, "sqlite3_value_text16");

  function value_text16be
    (value : SQLite3.types.value_t) return cs.chars_ptr;
  pragma import (c, value_text16be, "sqlite3_value_text16be");

  function value_text16le
    (value : SQLite3.types.value_t) return cs.chars_ptr;
  pragma import (c, value_text16le, "sqlite3_value_text16le");

  function value_type
    (value : SQLite3.types.value_t) return SQLite3.types.int_t;
  pragma import (c, value_type, "sqlite3_value_type");

  function vfs_find
    (name : cs.chars_ptr) return SQLite3.types.vfs_t;
  pragma import (c, vfs_find, "sqlite3_vfs_find");

  function vfs_register
    (vfs          : SQLite3.types.vfs_t;
     make_default : SQLite3.types.int_t) return SQLite3.types.int_t;
  pragma import (c, vfs_register, "sqlite3_vfs_register");

  function vfs_unregister
    (vfs : SQLite3.types.vfs_t) return SQLite3.types.int_t;
  pragma import (c, vfs_unregister, "sqlite3_vfs_unregister");

end SQLite3.thin;
