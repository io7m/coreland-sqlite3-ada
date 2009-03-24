with Interfaces.C;
with Interfaces.C.Strings;
with System;
with C_String.Arrays;

package SQLite3.Types is
  package C renames Interfaces.C;
  package CS renames Interfaces.C.Strings;

  -- integer types
  subtype int_t is C.int;
  subtype double_t is C.double;

  type int8_t is range -16#7f# .. 16#7f#;
  type int16_t is range -16#7fff# .. 16#7fff#;
  type int32_t is range -16#7fffffff# .. 16#7fffffff#;
  type int64_t is range -16#7fffffff_ffffffff# .. 16#7fffffff_ffffffff#;

  type uint8_t is mod 2 ** 8;
  type uint16_t is mod 2 ** 16;
  type uint32_t is mod 2 ** 32;
  type uint64_t is mod 2 ** 64;

  for int8_t'Size use 8;
  for int16_t'Size use 16;
  for int32_t'Size use 32;
  for int64_t'Size use 64;

  for uint8_t'Size use 8;
  for uint16_t'Size use 16;
  for uint32_t'Size use 32;
  for uint64_t'Size use 64;

  type int_access_t is access all C.int;
  type int8_access_t is access all int8_t;
  type int16_access_t is access all int16_t;
  type int32_access_t is access all int32_t;
  type int64_access_t is access all int64_t;

  type uint8_access_t is access all uint8_t;
  type uint16_access_t is access all uint16_t;
  type uint32_access_t is access all uint32_t;
  type uint64_access_t is access all uint64_t;

  pragma Convention (C, int8_t);
  pragma Convention (C, int16_t);
  pragma Convention (C, int32_t);
  pragma Convention (C, uint8_t);
  pragma Convention (C, uint16_t);
  pragma Convention (C, uint32_t);
  pragma Convention (C, uint64_t);

  pragma Convention (C, int8_access_t);
  pragma Convention (C, int16_access_t);
  pragma Convention (C, int32_access_t);
  pragma Convention (C, uint8_access_t);
  pragma Convention (C, uint16_access_t);
  pragma Convention (C, uint32_access_t);
  pragma Convention (C, uint64_access_t);

  -- Pointer types
  subtype void_ptr_t is System.Address;
  Null_Ptr : constant void_ptr_t := System.Null_Address;

  -- DB types
  type Database_t is access all System.Address;
  pragma Convention (C, Database_t);

  type blob_t is access all System.Address;
  pragma Convention (C, blob_t);

  type context_t is access all System.Address;
  pragma Convention (C, context_t);

  type mutex_t is access all System.Address;
  pragma Convention (C, mutex_t);

  type statement_t is access all System.Address;
  pragma Convention (C, statement_t);

  type value_t is access all System.Address;
  pragma Convention (C, value_t);

  type vfs_t is access all System.Address;
  pragma Convention (C, vfs_t);

  subtype char_2star_t is C_String.Arrays.Pointer_Array_t;
  type char_3star_t is access all char_2star_t;
  pragma Convention (C, char_3star_t);

  type text_encoding_t is (UTF8, UTF16LE, UTF16BE, UTF16, ANY, UTF16_ALIGNED);
  for text_encoding_t use
    (UTF8          => 1,
     UTF16LE       => 2,
     UTF16BE       => 3,
     UTF16         => 4,
     ANY           => 5,
     UTF16_ALIGNED => 8);
  pragma Convention (C, text_encoding_t);

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
  pragma Convention (C, mutex_type_t);

  -- callback types

  type auth_callback_t is access function
    (data    : void_ptr_t;
     action  : int_t;
     string1 : CS.chars_ptr; -- xxx: thank you for not documenting. x.
     string2 : CS.chars_ptr;
     string3 : CS.chars_ptr;
     string4 : CS.chars_ptr) return int_t;
  pragma Convention (C, auth_callback_t);

  type auxdata_callback_t is access procedure
    (data : void_ptr_t);
  pragma Convention (C, auxdata_callback_t);

  type change_callback_t is access procedure
    (data          : void_ptr_t;
     action        : int_t;
     database_name : CS.chars_ptr;
     column_name   : CS.chars_ptr;
     row_id        : int64_t);
  pragma Convention (C, change_callback_t);

  type destructor_callback_t is access function
    (blob : void_ptr_t) return void_ptr_t;
  pragma Convention (C, destructor_callback_t);

  type busy_callback_t is access function
    (data  : void_ptr_t;
     times : int_t) return int_t;
  pragma Convention (C, busy_callback_t);

  type collation_callback_t is access function
    (data     : void_ptr_t;
     db       : Database_t;
     encoding : text_encoding_t;
     text     : CS.chars_ptr) return void_ptr_t;
  pragma Convention (C, collation_callback_t);

  type collation16_callback_t is access function
    (data     : void_ptr_t;
     db       : Database_t;
     encoding : text_encoding_t;
     text     : CS.chars_ptr) return void_ptr_t;
  pragma Convention (C, collation16_callback_t);

  type commit_callback_t is access function
    (data : void_ptr_t) return int_t;
  pragma Convention (C, commit_callback_t);

  type compare_callback_t is access function
    (data     : void_ptr_t;
     encoding : text_encoding_t;
     string1  : CS.chars_ptr;
     length   : int_t;
     string2  : CS.chars_ptr) return int_t;
  pragma Convention (C, compare_callback_t);

  type create_func_callback_t is access procedure
    (context  : context_t;
     num_args : int_t;
     value    : access value_t);
  pragma Convention (C, create_func_callback_t);

  type create_step_callback_t is access procedure
    (context  : context_t;
     num_args : int_t;
     value    : access value_t);
  pragma Convention (C, create_step_callback_t);

  type create_final_callback_t is access procedure
    (context  : context_t);
  pragma Convention (C, create_final_callback_t);

  type exec_callback_t is access procedure
    (context       : void_ptr_t;
     num_columns   : int_t;
     column_values : char_2star_t;
     column_names  : char_2star_t);
  pragma Convention (C, exec_callback_t);

  type progress_callback_t is access function
    (data : void_ptr_t) return int_t;
  pragma Convention (C, progress_callback_t);

  type result_callback_t is access procedure
    (data : void_ptr_t);
  pragma Convention (C, result_callback_t);

  type rollback_callback_t is access procedure
    (data : void_ptr_t);
  pragma Convention (C, rollback_callback_t);

end SQLite3.Types;
