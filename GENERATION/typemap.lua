local typemap = {}
local string_ex = require ("string_ex")

function typemap.load (name)
  assert (type (name) == "string")

  local fh, msg = io.open (name)
  if not fh then
    error ("fatal: open: "..name.." - "..msg)
  end

  local types = {}
  types.ctypes = {}
  types.adatypes = {}

  for line in fh:lines() do
    local pair = string_ex.split (line, ":")
    local ctype = pair [1]
    local atype = pair [2]

    types.ctypes[atype] = ctype
    types.adatypes[ctype] = atype
  end

  return types
end

return typemap
