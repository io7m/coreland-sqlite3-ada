with sqlite3.types;
with interfaces.c.strings;

package sqlite3.thin is
  package cs renames interfaces.c.strings;

  function aggregate_context
    (context   : sqlite3.types.context_t;
     num_bytes : sqlite3.types.int_t) return sqlite3.types.void_ptr_t;
  pragma import (c, aggregate_context, "sqlite3_aggregate_context");

  function auto_extension
    (entry_point : sqlite3.types.void_ptr_t) return sqlite3.types.int_t;
  pragma import (c, auto_extension, "sqlite3_auto_extension");

  function bind_blob
    (stmt       : sqlite3.types.statement_t;
     index      : sqlite3.types.int_t;
     blob       : sqlite3.types.void_ptr_t;
     num_bytes  : sqlite3.types.int_t;
     destructor : sqlite3.types.destructor_callback_t) return sqlite3.types.int_t;
  pragma import (c, bind_blob, "sqlite3_bind_blob");

  function bind_double
    (stmt  : sqlite3.types.statement_t;
     index : sqlite3.types.int_t;
     value : sqlite3.types.double_t) return sqlite3.types.int_t;
  pragma import (c, bind_double, "sqlite3_bind_double");

  function bind_int
    (stmt  : sqlite3.types.statement_t;
     index : sqlite3.types.int_t;
     value : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, bind_int, "sqlite3_bind_int");

  function bind_int64
    (stmt  : sqlite3.types.statement_t;
     index : sqlite3.types.int_t;
     value : sqlite3.types.int64_t) return sqlite3.types.int_t;
  pragma import (c, bind_int64, "sqlite3_bind_int64");

  function bind_null
    (stmt  : sqlite3.types.statement_t;
     index : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, bind_null, "sqlite3_bind_null");

  function bind_parameter_count
    (stmt : sqlite3.types.statement_t;
     num  : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, bind_parameter_count, "sqlite3_bind_parameter_count");

  function bind_parameter_index
    (stmt : sqlite3.types.statement_t) return sqlite3.types.int_t;
  pragma import (c, bind_parameter_index, "sqlite3_bind_parameter_index");

  function bind_parameter_name
    (stmt : sqlite3.types.statement_t;
     name : cs.chars_ptr) return cs.chars_ptr;
  pragma import (c, bind_parameter_name, "sqlite3_bind_parameter_name");

  function bind_text
    (stmt       : sqlite3.types.statement_t;
     index      : sqlite3.types.int_t;
     blob       : cs.chars_ptr;
     num_bytes  : sqlite3.types.int_t;
     destructor : sqlite3.types.destructor_callback_t) return sqlite3.types.int_t;
  pragma import (c, bind_text, "sqlite3_bind_text");

  function bind_text16
    (stmt       : sqlite3.types.statement_t;
     index      : sqlite3.types.int_t;
     text       : cs.chars_ptr;
     num_bytes  : sqlite3.types.int_t;
     destructor : sqlite3.types.destructor_callback_t) return sqlite3.types.int_t;
  pragma import (c, bind_text16, "sqlite3_bind_text16");

  function bind_value
    (stmt  : sqlite3.types.statement_t;
     index : sqlite3.types.int_t;
     value : sqlite3.types.value_t) return sqlite3.types.int_t;
  pragma import (c, bind_value, "sqlite3_bind_value");

  function bind_zeroblob
    (stmt      : sqlite3.types.statement_t;
     index     : sqlite3.types.int_t;
     num_bytes : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, bind_zeroblob, "sqlite3_bind_zeroblob");

  function blob_bytes
    (blob : sqlite3.types.blob_t) return sqlite3.types.int_t;
  pragma import (c, blob_bytes, "sqlite3_blob_bytes");

  function blob_close
    (blob : sqlite3.types.blob_t) return sqlite3.types.int_t;
  pragma import (c, blob_close, "sqlite3_blob_close");

  function blob_open
    (sql    : sqlite3.types.database_t;
     db     : cs.chars_ptr;
     table  : cs.chars_ptr;
     column : cs.chars_ptr;
     row    : sqlite3.types.int64_t;
     flags  : sqlite3.types.int_t;
     blob   : access sqlite3.types.blob_t) return sqlite3.types.int_t;
  pragma import (c, blob_open, "sqlite3_blob_open");

  function blob_read
    (blob      : sqlite3.types.blob_t;
     buffer    : sqlite3.types.void_ptr_t;
     num_bytes : sqlite3.types.int_t;
     offset    : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, blob_read, "sqlite3_blob_read");

  function blob_write
    (blob      : sqlite3.types.blob_t;
     buffer    : sqlite3.types.void_ptr_t;
     num_bytes : sqlite3.types.int_t;
     offset    : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, blob_write, "sqlite3_blob_write");

  function busy_handler
    (sql      : sqlite3.types.database_t;
     callback : sqlite3.types.busy_callback_t;
     context  : sqlite3.types.void_ptr_t) return sqlite3.types.int_t;
  pragma import (c, busy_handler, "sqlite3_busy_handler");

  function busy_timeout
    (sql : sqlite3.types.database_t;
     ms  : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, busy_timeout, "sqlite3_busy_timeout");

  function changes
    (sql : sqlite3.types.database_t) return sqlite3.types.int_t;
  pragma import (c, changes, "sqlite3_changes");

  function clear_bindings
    (stmt : sqlite3.types.statement_t) return sqlite3.types.int_t;
  pragma import (c, clear_bindings, "sqlite3_clear_bindings");

  function close
    (sql : sqlite3.types.database_t) return sqlite3.types.int_t;
  pragma import (c, close, "sqlite3_close");

  function collation_needed
    (db       : sqlite3.types.database_t;
     context  : sqlite3.types.void_ptr_t;
     callback : sqlite3.types.collation_callback_t) return sqlite3.types.int_t;
  pragma import (c, collation_needed, "sqlite3_collation_needed");

  function collation_needed16
    (db       : sqlite3.types.database_t;
     context  : cs.chars_ptr;
     callback : sqlite3.types.collation16_callback_t) return sqlite3.types.int_t;
  pragma import (c, collation_needed16, "sqlite3_collation_needed16");

  function column_blob
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return sqlite3.types.void_ptr_t;
  pragma import (c, column_blob, "sqlite3_column_blob");

  function column_bytes
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, column_bytes, "sqlite3_column_bytes");

  function column_bytes16
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, column_bytes16, "sqlite3_column_bytes16");

  function column_count
    (stmt : sqlite3.types.statement_t) return sqlite3.types.int_t;
  pragma import (c, column_count, "sqlite3_column_count");

  function column_database_name
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_database_name, "sqlite3_column_database_name");

  function column_database_name16
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_database_name16, "sqlite3_column_database_name16");

  function column_decltype
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_decltype, "sqlite3_column_decltype");

  function column_decltype16
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_decltype16, "sqlite3_column_decltype16");

  function column_double
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return sqlite3.types.double_t;
  pragma import (c, column_double, "sqlite3_column_double");

  function column_int
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, column_int, "sqlite3_column_int");

  function column_int64
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return sqlite3.types.int64_t;
  pragma import (c, column_int64, "sqlite3_column_int64");

  function column_name
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_name, "sqlite3_column_name");

  function column_name16
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_name16, "sqlite3_column_name16");

  function column_origin_name
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_origin_name, "sqlite3_column_origin_name");

  function column_origin_name16
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_origin_name16, "sqlite3_column_origin_name16");

  function column_table_name
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_table_name, "sqlite3_column_table_name");

  function column_table_name16
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_table_name16, "sqlite3_column_table_name16");

  function column_text
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_text, "sqlite3_column_text");

  function column_text16
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return cs.chars_ptr;
  pragma import (c, column_text16, "sqlite3_column_text16");

  function column_type
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, column_type, "sqlite3_column_type");

  function column_value
    (stmt   : sqlite3.types.statement_t;
     column : sqlite3.types.int_t) return sqlite3.types.value_t;
  pragma import (c, column_value, "sqlite3_column_value");

  function commit_hook
    (sql      : sqlite3.types.database_t;
     callback : sqlite3.types.commit_callback_t;
     context  : sqlite3.types.void_ptr_t) return sqlite3.types.void_ptr_t;
  pragma import (c, commit_hook, "sqlite3_commit_hook");

  function complete
    (sql : sqlite3.types.database_t) return sqlite3.types.int_t;
  pragma import (c, complete, "sqlite3_complete");

  function complete16
    (sql : sqlite3.types.database_t) return sqlite3.types.int_t;
  pragma import (c, complete16, "sqlite3_complete16");

  function context_db_handle
    (context : sqlite3.types.context_t) return sqlite3.types.database_t;
  pragma import (c, context_db_handle, "sqlite3_context_db_handle");

  function create_collation
    (sql      : sqlite3.types.database_t;
     name     : cs.chars_ptr;
     encoding : sqlite3.types.text_encoding_t;
     context  : sqlite3.types.void_ptr_t;
     callback : sqlite3.types.compare_callback_t) return sqlite3.types.int_t;
  pragma import (c, create_collation, "sqlite3_create_collation");

  function create_collation16
    (sql      : sqlite3.types.database_t;
     name     : cs.chars_ptr;
     encoding : sqlite3.types.text_encoding_t;
     context  : sqlite3.types.void_ptr_t;
     callback : sqlite3.types.compare_callback_t) return sqlite3.types.int_t;
  pragma import (c, create_collation16, "sqlite3_create_collation16");

  function create_function
    (sql           : sqlite3.types.database_t;
     name          : cs.chars_ptr;
     num_arguments : sqlite3.types.int_t;
     encoding      : sqlite3.types.text_encoding_t;
     user_data     : sqlite3.types.void_ptr_t;
     func          : sqlite3.types.create_func_callback_t;
     step          : sqlite3.types.create_step_callback_t;
     final         : sqlite3.types.create_final_callback_t) return sqlite3.types.int_t;
  pragma import (c, create_function, "sqlite3_create_function");

  function create_function16
    (sql           : sqlite3.types.database_t;
     name          : cs.chars_ptr;
     num_arguments : sqlite3.types.int_t;
     encoding      : sqlite3.types.text_encoding_t;
     user_data     : sqlite3.types.void_ptr_t;
     func          : sqlite3.types.create_func_callback_t;
     step          : sqlite3.types.create_step_callback_t;
     final         : sqlite3.types.create_final_callback_t) return sqlite3.types.int_t;
  pragma import (c, create_function16, "sqlite3_create_function16");

  function data_count
    (stmt : sqlite3.types.statement_t) return sqlite3.types.int_t;
  pragma import (c, data_count, "sqlite3_data_count");

  function db_handle
    (stmt : sqlite3.types.statement_t) return sqlite3.types.database_t;
  pragma import (c, db_handle, "sqlite3_db_handle");

  function enable_load_extension
    (db    : sqlite3.types.database_t;
     onoff : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, enable_load_extension, "sqlite3_enable_load_extension");

  function enable_shared_cache
    (onoff : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, enable_shared_cache, "sqlite3_enable_shared_cache");

  function errcode
    (db : sqlite3.types.database_t) return sqlite3.types.int_t;
  pragma import (c, errcode, "sqlite3_errcode");

  function errmsg
    (db : sqlite3.types.database_t) return cs.chars_ptr;
  pragma import (c, errmsg, "sqlite3_errmsg");

  function errmsg16
    (db : sqlite3.types.database_t) return cs.chars_ptr;
  pragma import (c, errmsg16, "sqlite3_errmsg16");

  function exec
    (db            : sqlite3.types.database_t;
     sql           : cs.chars_ptr;
     callback      : sqlite3.types.exec_callback_t;
     context       : sqlite3.types.void_ptr_t;
     error_message : sqlite3.types.char_2star_t) return sqlite3.types.int_t;
  pragma import (c, exec, "sqlite3_exec");

  function extended_result_codes
    (db    : sqlite3.types.database_t;
     onoff : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, extended_result_codes, "sqlite3_extended_result_codes");

  function file_control
    (db      : sqlite3.types.database_t;
     db_name : cs.chars_ptr;
     op      : sqlite3.types.int_t;
     context : sqlite3.types.void_ptr_t) return sqlite3.types.int_t;
  pragma import (c, file_control, "sqlite3_file_control");

  function finalize
    (stmt : sqlite3.types.statement_t) return sqlite3.types.int_t;
  pragma import (c, finalize, "sqlite3_finalize");

  procedure free
    (address : sqlite3.types.void_ptr_t);
  pragma import (c, free, "sqlite3_free");

  procedure free_table
    (table : sqlite3.types.char_2star_t);
  pragma import (c, free_table, "sqlite3_free_table");

  function get_autocommit
    (db : sqlite3.types.database_t) return sqlite3.types.int_t;
  pragma import (c, get_autocommit, "sqlite3_get_autocommit");

  function get_auxdata
    (context : sqlite3.types.context_t;
     n       : sqlite3.types.int_t) return sqlite3.types.void_ptr_t;
  pragma import (c, get_auxdata, "sqlite3_get_auxdata");

  function get_table
    (db            : sqlite3.types.database_t;
     sql           : cs.chars_ptr;
     result        : sqlite3.types.char_3star_t;
     row           : sqlite3.types.int_access_t;
     column        : sqlite3.types.int_access_t;
     error_message : sqlite3.types.char_2star_t) return sqlite3.types.int_t;
  pragma import (c, get_table, "sqlite3_get_table");

  function initialize return sqlite3.types.int_t;
  pragma import (c, initialize, "sqlite3_initialize");

  procedure interrupt
    (db : sqlite3.types.database_t);
  pragma import (c, interrupt, "sqlite3_interrupt");

  function last_insert_rowid
    (db : sqlite3.types.database_t) return sqlite3.types.int64_t;
  pragma import (c, last_insert_rowid, "sqlite3_last_insert_rowid");

  function libversion return cs.chars_ptr;
  pragma import (c, libversion, "sqlite3_libversion");

  function libversion_number return sqlite3.types.int_t;
  pragma import (c, libversion_number, "sqlite3_libversion_number");

  function limit
    (db        : sqlite3.types.database_t;
     id        : sqlite3.types.int_t;
     new_value : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, limit, "sqlite3_limit");

  function load_extension
    (db            : sqlite3.types.database_t;
     file          : cs.chars_ptr;
     exten_entry   : cs.chars_ptr;
     error_message : sqlite3.types.char_2star_t) return sqlite3.types.int_t;
  pragma import (c, load_extension, "sqlite3_load_extension");

  function malloc
    (bytes : sqlite3.types.int_t) return sqlite3.types.void_ptr_t;
  pragma import (c, malloc, "sqlite3_malloc");

  function memory_highwater
    (reset_flag : sqlite3.types.int_t) return sqlite3.types.int64_t;
  pragma import (c, memory_highwater, "sqlite3_memory_highwater");

  function memory_used return sqlite3.types.int64_t;
  pragma import (c, memory_used, "sqlite3_memory_used");

  function mutex_alloc
    (mutex_type : sqlite3.types.mutex_type_t) return sqlite3.types.mutex_t;
  pragma import (c, mutex_alloc, "sqlite3_mutex_alloc");

  procedure mutex_enter
    (mutex : sqlite3.types.mutex_t);
  pragma import (c, mutex_enter, "sqlite3_mutex_enter");

  procedure mutex_free
    (mutex : sqlite3.types.mutex_t);
  pragma import (c, mutex_free, "sqlite3_mutex_free");

  function mutex_held
    (mutex : sqlite3.types.mutex_t) return sqlite3.types.int_t;
  pragma import (c, mutex_held, "sqlite3_mutex_held");

  procedure mutex_leave
    (mutex : sqlite3.types.mutex_t);
  pragma import (c, mutex_leave, "sqlite3_mutex_leave");

  function mutex_notheld
    (mutex : sqlite3.types.mutex_t) return sqlite3.types.int_t;
  pragma import (c, mutex_notheld, "sqlite3_mutex_notheld");

  function mutex_try
    (mutex : sqlite3.types.mutex_t) return sqlite3.types.int_t;
  pragma import (c, mutex_try, "sqlite3_mutex_try");

  function next_stmt
    (db   : sqlite3.types.database_t;
     stmt : sqlite3.types.statement_t) return sqlite3.types.statement_t;
  pragma import (c, next_stmt, "sqlite3_next_stmt");

  function open
    (file : cs.chars_ptr;
     db   : access sqlite3.types.database_t) return sqlite3.types.int_t;
  pragma import (c, open, "sqlite3_open");

  function open16
    (file : cs.chars_ptr;
     db   : access sqlite3.types.database_t) return sqlite3.types.int_t;
  pragma import (c, open16, "sqlite3_open16");

  function os_end return sqlite3.types.int_t;
  pragma import (c, os_end, "sqlite3_os_end");

  function os_init return sqlite3.types.int_t;
  pragma import (c, os_init, "sqlite3_os_init");

  -- "Note that the use of sqlite3_prepare() is not recommended for new
  -- applications. The alternative routine sqlite3_prepare_v2() should be
  -- used instead."

  function prepare
    (db         : sqlite3.types.database_t;
     sql        : cs.chars_ptr;
     sql_length : sqlite3.types.int_t;
     stmt       : access sqlite3.types.statement_t;
     tail       : sqlite3.types.char_2star_t) return sqlite3.types.int_t;
  pragma import (c, prepare, "sqlite3_prepare_v2");

  function prepare16
    (db         : sqlite3.types.database_t;
     sql        : cs.chars_ptr;
     sql_length : sqlite3.types.int_t;
     stmt       : access sqlite3.types.statement_t;
     tail       : sqlite3.types.char_2star_t) return sqlite3.types.int_t;
  pragma import (c, prepare16, "sqlite3_prepare16_v2");

  procedure progress_handler
    (db       : sqlite3.types.database_t;
     opcodes  : sqlite3.types.int_t;
     callback : sqlite3.types.progress_callback_t;
     context  : sqlite3.types.void_ptr_t);
  pragma import (c, progress_handler, "sqlite3_progress_handler");

  procedure randomness
    (bytes   : sqlite3.types.int_t;
     address : sqlite3.types.void_ptr_t);
  pragma import (c, randomness, "sqlite3_randomness");

  function realloc
    (address : sqlite3.types.void_ptr_t;
     size    : sqlite3.types.int_t) return sqlite3.types.void_ptr_t;
  pragma import (c, realloc, "sqlite3_realloc");

  function release_memory
    (flag : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, release_memory, "sqlite3_release_memory");

  function reset
    (stmt : sqlite3.types.statement_t) return sqlite3.types.int_t;
  pragma import (c, reset, "sqlite3_reset");

  procedure reset_auto_extension;
  pragma import (c, reset_auto_extension, "sqlite3_reset_auto_extension");

  procedure result_blob
    (context   : sqlite3.types.context_t;
     blob      : sqlite3.types.void_ptr_t;
     num_bytes : sqlite3.types.int_t;
     callback  : sqlite3.types.result_callback_t);
  pragma import (c, result_blob, "sqlite3_result_blob");

  procedure result_double
    (context : sqlite3.types.context_t;
     value   : sqlite3.types.double_t);
  pragma import (c, result_double, "sqlite3_result_double");

  procedure result_error
    (context   : sqlite3.types.context_t;
     value     : cs.chars_ptr;
     num_bytes : sqlite3.types.int_t);
  pragma import (c, result_error, "sqlite3_result_error");

  procedure result_error16
    (context   : sqlite3.types.context_t;
     value     : cs.chars_ptr;
     num_bytes : sqlite3.types.int_t);
  pragma import (c, result_error16, "sqlite3_result_error16");

  procedure result_error_code
    (context    : sqlite3.types.context_t;
     error_code : sqlite3.types.int_t);
  pragma import (c, result_error_code, "sqlite3_result_error_code");

  procedure result_error_nomem
    (context : sqlite3.types.context_t);
  pragma import (c, result_error_nomem, "sqlite3_result_error_nomem");

  procedure result_error_toobig
    (context : sqlite3.types.context_t);
  pragma import (c, result_error_toobig, "sqlite3_result_error_toobig");

  procedure result_int
    (context : sqlite3.types.context_t;
     value   : sqlite3.types.int_t);
  pragma import (c, result_int, "sqlite3_result_int");

  procedure result_int64
    (context : sqlite3.types.context_t;
     value   : sqlite3.types.int64_t);
  pragma import (c, result_int64, "sqlite3_result_int64");

  procedure result_null
    (context : sqlite3.types.context_t);
  pragma import (c, result_null, "sqlite3_result_null");

  procedure result_text
    (context   : sqlite3.types.context_t;
     text      : cs.chars_ptr;
     num_bytes : sqlite3.types.int_t;
     callback  : sqlite3.types.result_callback_t);
  pragma import (c, result_text, "sqlite3_result_text");

  procedure result_text16
    (context   : sqlite3.types.context_t;
     text      : cs.chars_ptr;
     num_bytes : sqlite3.types.int_t;
     callback  : sqlite3.types.result_callback_t);
  pragma import (c, result_text16, "sqlite3_result_text16");

  procedure result_text16be
    (context   : sqlite3.types.context_t;
     text      : cs.chars_ptr;
     num_bytes : sqlite3.types.int_t;
     callback  : sqlite3.types.result_callback_t);
  pragma import (c, result_text16be, "sqlite3_result_text16be");

  procedure result_text16le
    (context   : sqlite3.types.context_t;
     text      : cs.chars_ptr;
     num_bytes : sqlite3.types.int_t;
     callback  : sqlite3.types.result_callback_t);
  pragma import (c, result_text16le, "sqlite3_result_text16le");

  procedure result_value
    (context : sqlite3.types.context_t;
     value   : sqlite3.types.value_t);
  pragma import (c, result_value, "sqlite3_result_value");

  procedure result_zeroblob
    (context   : sqlite3.types.context_t;
     num_bytes : sqlite3.types.int_t);
  pragma import (c, result_zeroblob, "sqlite3_result_zeroblob");

  function rollback_hook
    (sql      : sqlite3.types.database_t;
     callback : sqlite3.types.rollback_callback_t;
     context  : sqlite3.types.void_ptr_t) return sqlite3.types.void_ptr_t;
  pragma import (c, rollback_hook, "sqlite3_rollback_hook");

  function set_authorizer
    (db       : sqlite3.types.database_t;
     callback : sqlite3.types.auth_callback_t;
     context  : sqlite3.types.void_ptr_t) return sqlite3.types.int_t;
  pragma import (c, set_authorizer, "sqlite3_set_authorizer");

  function set_auxdata
    (context  : sqlite3.types.context_t;
     index    : sqlite3.types.int_t;
     data     : sqlite3.types.void_ptr_t;
     callback : sqlite3.types.auxdata_callback_t) return sqlite3.types.void_ptr_t;
  pragma import (c, set_auxdata, "sqlite3_set_auxdata");

  function shutdown return sqlite3.types.int_t;
  pragma import (c, shutdown, "sqlite3_shutdown");

  function sleep
    (time : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, sleep, "sqlite3_sleep");

  procedure soft_heap_limit
    (limit : sqlite3.types.int_t);
  pragma import (c, soft_heap_limit, "sqlite3_soft_heap_limit");

  function sql
    (stmt : sqlite3.types.statement_t) return cs.chars_ptr;
  pragma import (c, sql, "sqlite3_sql");

  function step
    (stmt : sqlite3.types.statement_t) return sqlite3.types.int_t;
  pragma import (c, step, "sqlite3_step");

  function table_column_metadata
    (db             : sqlite3.types.database_t;
     db_name        : cs.chars_ptr;
     table_name     : cs.chars_ptr;
     column_name    : cs.chars_ptr;
     data_type      : sqlite3.types.char_2star_t;
     collation_seq  : sqlite3.types.char_2star_t;
     not_null       : sqlite3.types.int_access_t;
     primary_key    : sqlite3.types.int_access_t;
     auto_increment : sqlite3.types.int_access_t) return sqlite3.types.int_t;
  pragma import (c, table_column_metadata, "sqlite3_table_column_metadata");

  function threadsafe return sqlite3.types.int_t;
  pragma import (c, threadsafe, "sqlite3_threadsafe");

  function total_changes
    (db : sqlite3.types.database_t) return sqlite3.types.int_t;
  pragma import (c, total_changes, "sqlite3_total_changes");

  function update_hook
    (db       : sqlite3.types.database_t;
     callback : sqlite3.types.change_callback_t;
     context  : sqlite3.types.void_ptr_t) return sqlite3.types.void_ptr_t;
  pragma import (c, update_hook, "sqlite3_update_hook");

  function user_data
    (context : sqlite3.types.context_t) return sqlite3.types.void_ptr_t;
  pragma import (c, user_data, "sqlite3_user_data");

  function value_blob
    (value : sqlite3.types.value_t) return sqlite3.types.void_ptr_t;
  pragma import (c, value_blob, "sqlite3_value_blob");

  function value_bytes
    (value : sqlite3.types.value_t) return sqlite3.types.int_t;
  pragma import (c, value_bytes, "sqlite3_value_bytes");

  function value_bytes16
    (value : sqlite3.types.value_t) return sqlite3.types.int_t;
  pragma import (c, value_bytes16, "sqlite3_value_bytes16");

  function value_double
    (value : sqlite3.types.value_t) return sqlite3.types.double_t;
  pragma import (c, value_double, "sqlite3_value_double");

  function value_int
    (value : sqlite3.types.value_t) return sqlite3.types.int_t;
  pragma import (c, value_int, "sqlite3_value_int");

  function value_int64
    (value : sqlite3.types.value_t) return sqlite3.types.int64_t;
  pragma import (c, value_int64, "sqlite3_value_int64");

  function value_numeric_type
    (value : sqlite3.types.value_t) return sqlite3.types.int_t;
  pragma import (c, value_numeric_type, "sqlite3_value_numeric_type");

  function value_text
    (value : sqlite3.types.value_t) return cs.chars_ptr;
  pragma import (c, value_text, "sqlite3_value_text");

  function value_text16
    (value : sqlite3.types.value_t) return cs.chars_ptr;
  pragma import (c, value_text16, "sqlite3_value_text16");

  function value_text16be
    (value : sqlite3.types.value_t) return cs.chars_ptr;
  pragma import (c, value_text16be, "sqlite3_value_text16be");

  function value_text16le
    (value : sqlite3.types.value_t) return cs.chars_ptr;
  pragma import (c, value_text16le, "sqlite3_value_text16le");

  function value_type
    (value : sqlite3.types.value_t) return sqlite3.types.int_t;
  pragma import (c, value_type, "sqlite3_value_type");

  function vfs_find
    (name : cs.chars_ptr) return sqlite3.types.vfs_t;
  pragma import (c, vfs_find, "sqlite3_vfs_find");

  function vfs_register
    (vfs          : sqlite3.types.vfs_t;
     make_default : sqlite3.types.int_t) return sqlite3.types.int_t;
  pragma import (c, vfs_register, "sqlite3_vfs_register");

  function vfs_unregister
    (vfs : sqlite3.types.vfs_t) return sqlite3.types.int_t;
  pragma import (c, vfs_unregister, "sqlite3_vfs_unregister");

end sqlite3.thin;
