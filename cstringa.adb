with system.storage_elements;
with system.address_to_access_conversions;
with interfaces.c.strings;

package body cstringa is
  package cs renames interfaces.c.strings;

  package memory is new system.address_to_access_conversions
    (object => cs.chars_ptr);

  use type cs.chars_ptr;
  use type memory.object_pointer;
  use system.storage_elements;

  word_size : constant := system.word_size / system.storage_unit;

  --
  -- iterate over an array of pointers, checking for null
  --

  function size_terminated
    (pointer : array_ptr_t) return natural
  is
    addr_current : system.address := pointer;
    size         : natural := 0;
    obj_pointer  : memory.object_pointer;
  begin
    loop
      obj_pointer := memory.to_pointer (addr_current);
      if obj_pointer.all = cs.null_ptr then
        return size;
      end if;
      addr_current := addr_current + word_size;
      size := size + 1;
    end loop;
  end size_terminated;

  --
  -- array_ptr [index]
  --

  function index_core
    (array_ptr : array_ptr_t;
     size      : natural;
     index     : natural) return string
  is
    addr_off  : constant storage_offset := storage_offset (index * word_size);
    addr_base : constant system.address := array_ptr;
    addr_cur  : constant system.address := addr_base + addr_off;
    pointer   : memory.object_pointer;
  begin
    pointer := memory.to_pointer (addr_cur);
    if pointer.all = cs.null_ptr then
      return "";
    end if;
    return cs.value (pointer.all);
  end index_core;
  pragma inline (index_core); 

  function index
    (pointer : array_ptr_t;
     size    : natural;
     index   : natural) return string is
  begin
    if size <= index then
      raise constraint_error with "index out of range";
    end if;
    return index_core
      (array_ptr => pointer,
       size      => size,
       index     => index);
  end index;
  pragma inline (index);

  function index
    (pointer : array_ptr_t;
     size    : natural;
     index : natural) return us.unbounded_string is
  begin
    if size <= index then
      raise constraint_error with "index out of range";
    end if;
    return us.to_unbounded_string
      (index_core
        (array_ptr => pointer,
         size      => size,
         index     => index));
  end index;
  pragma inline (index);

  function index_terminated
    (pointer : array_ptr_t;
     index   : natural) return string is
  begin
    return index_core
      (array_ptr => pointer,
       size      => size_terminated (pointer),
       index     => index);
  end index_terminated;
  pragma inline (index_terminated);

  function index_terminated
    (pointer : array_ptr_t;
     index   : natural) return us.unbounded_string is
  begin
    return us.to_unbounded_string
      (index_core
        (array_ptr => pointer,
         size      => size_terminated (pointer),
         index     => index));
  end index_terminated;
  pragma inline (index_terminated);

  --
  -- for (index = 0; index < size; ++index)
  --   output [index] = pointer [index]
  --

  function convert
    (pointer : array_ptr_t;
     size    : natural) return strings_t
  is
    table : strings_t (0 .. size - 1);
  begin
    for table_index in table'range loop
      table (table_index) := us.to_unbounded_string
        (index_core
          (array_ptr => pointer,
           size      => size,
           index     => table_index));
    end loop;
    return table;
  end;

end cstringa;
