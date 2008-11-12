with interfaces.c;
with interfaces.c.strings;
with system;

package sqlite3.types is
  package c renames interfaces.c;
  package cs renames interfaces.c.strings;

  -- integer types
  subtype int_t is c.int;
  subtype double_t is c.double;

  type int8_t is range -16#7f# .. 16#7f#;
  type int16_t is range -16#7fff# .. 16#7fff#;
  type int32_t is range -16#7fffffff# .. 16#7fffffff#;
  type int64_t is range -16#7fffffff_ffffffff# .. 16#7fffffff_ffffffff#;

  type uint8_t is mod 2 ** 8;
  type uint16_t is mod 2 ** 16;
  type uint32_t is mod 2 ** 32;
  type uint64_t is mod 2 ** 64;

  for int8_t'size use 8;
  for int16_t'size use 16;
  for int32_t'size use 32;
  for int64_t'size use 64;

  for uint8_t'size use 8;
  for uint16_t'size use 16;
  for uint32_t'size use 32;
  for uint64_t'size use 64;

  type int_access_t is access all c.int;
  type int8_access_t is access all int8_t;
  type int16_access_t is access all int16_t;
  type int32_access_t is access all int32_t;
  type int64_access_t is access all int64_t;

  type uint8_access_t is access all uint8_t;
  type uint16_access_t is access all uint16_t;
  type uint32_access_t is access all uint32_t;
  type uint64_access_t is access all uint64_t;

  pragma convention (c, int8_t);
  pragma convention (c, int16_t);
  pragma convention (c, int32_t);
  pragma convention (c, uint8_t);
  pragma convention (c, uint16_t);
  pragma convention (c, uint32_t);
  pragma convention (c, uint64_t);

  pragma convention (c, int8_access_t);
  pragma convention (c, int16_access_t);
  pragma convention (c, int32_access_t);
  pragma convention (c, uint8_access_t);
  pragma convention (c, uint16_access_t);
  pragma convention (c, uint32_access_t);
  pragma convention (c, uint64_access_t);

  -- Pointer types
  subtype void_ptr_t is system.address;
  null_ptr : constant void_ptr_t := system.null_address;

  -- DB types
  type database_t is access all system.address;
  pragma convention (c, database_t);

  type blob_t is access all system.address;
  pragma convention (c, blob_t);

  type context_t is access all system.address;
  pragma convention (c, context_t);

  type mutex_t is access all system.address;
  pragma convention (c, mutex_t);

  type statement_t is access all system.address;
  pragma convention (c, statement_t);

  type value_t is access all system.address;
  pragma convention (c, value_t);

  type vfs_t is access all system.address;
  pragma convention (c, vfs_t);

  type char_2star_t is access all cs.chars_ptr;
  pragma convention (c, char_2star_t);

  type char_3star_t is access all char_2star_t;
  pragma convention (c, char_3star_t);

  type text_encoding_t is (UTF8, UTF16LE, UTF16BE, UTF16, ANY, UTF16_ALIGNED);
  for text_encoding_t use
    (UTF8          => 1,
     UTF16LE       => 2,
     UTF16BE       => 3,
     UTF16         => 4,
     ANY           => 5,
     UTF16_ALIGNED => 8);
  pragma convention (c, text_encoding_t);

  type mutex_type_t is
    (MUTEX_FAST,
     MUTEX_RECURSIVE,
     MUTEX_STATIC_MASTER,
     MUTEX_STATIC_MEM,
     MUTEX_STATIC_MEM2,
     MUTEX_STATIC_PRNG,
     MUTEX_STATIC_LRU,
     MUTEX_STATIC_LRU2);
  for mutex_type_t use
    (MUTEX_FAST          => 0,
     MUTEX_RECURSIVE     => 1,
     MUTEX_STATIC_MASTER => 2,
     MUTEX_STATIC_MEM    => 3, 
     MUTEX_STATIC_MEM2   => 4,
     MUTEX_STATIC_PRNG   => 5,
     MUTEX_STATIC_LRU    => 6,
     MUTEX_STATIC_LRU2   => 7);
  pragma convention (c, mutex_type_t);

  -- callback types

  type auth_callback_t is access function
    (data    : void_ptr_t;
     action  : int_t;
     string1 : cs.chars_ptr; -- xxx: thank you for not documenting. x.
     string2 : cs.chars_ptr;
     string3 : cs.chars_ptr;
     string4 : cs.chars_ptr) return int_t;
  pragma convention (c, auth_callback_t);

  type auxdata_callback_t is access procedure
    (data : void_ptr_t);
  pragma convention (c, auxdata_callback_t);

  type change_callback_t is access procedure
    (data          : void_ptr_t;
     action        : int_t;
     database_name : cs.chars_ptr;
     column_name   : cs.chars_ptr;
     row_id        : int64_t);
  pragma convention (c, change_callback_t);

  type destructor_callback_t is access function
    (blob : void_ptr_t) return void_ptr_t;
  pragma convention (c, destructor_callback_t);

  type busy_callback_t is access function
    (data  : void_ptr_t;
     times : int_t) return int_t;
  pragma convention (c, busy_callback_t);

  type collation_callback_t is access function
    (data     : void_ptr_t;
     db       : database_t;
     encoding : text_encoding_t;
     text     : cs.chars_ptr) return void_ptr_t;
  pragma convention (c, collation_callback_t);

  type collation16_callback_t is access function
    (data     : void_ptr_t;
     db       : database_t;
     encoding : text_encoding_t;
     text     : cs.chars_ptr) return void_ptr_t;
  pragma convention (c, collation16_callback_t);

  type commit_callback_t is access function
    (data : void_ptr_t) return int_t;
  pragma convention (c, commit_callback_t);

  type compare_callback_t is access function
    (data     : void_ptr_t;
     encoding : text_encoding_t;
     string1  : cs.chars_ptr;
     length   : int_t;
     string2  : cs.chars_ptr) return int_t;
  pragma convention (c, compare_callback_t);

  type create_func_callback_t is access procedure
    (context  : context_t;
     num_args : int_t;
     value    : access value_t);
  pragma convention (c, create_func_callback_t);

  type create_step_callback_t is access procedure
    (context  : context_t;
     num_args : int_t;
     value    : access value_t);
  pragma convention (c, create_step_callback_t);

  type create_final_callback_t is access procedure
    (context  : context_t);
  pragma convention (c, create_final_callback_t);

  type exec_callback_t is access procedure
    (context       : void_ptr_t;
     num_columns   : int_t;
     column_values : char_2star_t;
     column_names  : char_2star_t);
  pragma convention (c, exec_callback_t);

  type progress_callback_t is access function
    (data : void_ptr_t) return int_t;
  pragma convention (c, progress_callback_t);

  type result_callback_t is access procedure
    (data : void_ptr_t);
  pragma convention (c, result_callback_t);

  type rollback_callback_t is access procedure
    (data : void_ptr_t);
  pragma convention (c, rollback_callback_t);

end sqlite3.types;
