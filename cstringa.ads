with ada.strings.unbounded;
with system;

package cstringa is
  package us renames ada.strings.unbounded;
  
  subtype array_ptr_t is system.address;
  null_ptr : constant array_ptr_t := system.null_address;

  type strings_t is array (natural range <>) of us.unbounded_string;

  --
  -- find NULL
  --

  function size_terminated
    (pointer : array_ptr_t) return natural;

  --
  -- array_ptr [index]
  --

  function index
    (pointer : array_ptr_t;
     size    : natural;
     index   : natural) return string;

  function index
    (pointer : array_ptr_t;
     size    : natural;
     index   : natural) return us.unbounded_string;

  function index_terminated
    (pointer : array_ptr_t;
     index   : natural) return string;

  function index_terminated
    (pointer : array_ptr_t;
     index   : natural) return us.unbounded_string;

  --
  -- for (index = 0; index < size; ++index)
  --   output [index] = pointer [index]
  --

  function convert
    (pointer : array_ptr_t;
     size    : natural) return strings_t;

end cstringa;
