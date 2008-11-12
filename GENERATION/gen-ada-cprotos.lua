#!/usr/bin/env lua

local string_ex = require ("string_ex")
local typemap = require ("typemap")

local argc = table.maxn (arg)
local argv = arg

local types = typemap.load (argv[1])

local function handle_procedure (symbol_name, args)
  io.write ([[
procedure ]] .. symbol_name)

  local num_args = table.maxn (args)
  if num_args >= 1 then
    local cur_num = 0
    io.write ("\n")
    for _, param in pairs (args) do
      local pair = string_ex.split (param, " ")
      local type = pair[1]
      local name = pair[2]

      cur_num = cur_num + 1
      type = types.adatypes[type]

      if cur_num == 1 then
        io.write ("  (")
      else
        io.write ("   ")
      end

      io.write (name..[[ : ]]..type)

      if cur_num == num_args then
        io.write (");\n")
      else
        io.write (";\n")
      end
    end
  else
    io.write (";\n")
  end

  io.write ([[pragma import (c, ]]..symbol_name..[[, "sqlite3_]]..symbol_name..[[");]])
  io.write ("\n")
  io.write ("\n")

end

local function handle_function (symbol_name, return_type, args)
  io.write ([[
function ]] .. symbol_name)

  local num_args = table.maxn (args)
  if num_args >= 1 then
    local cur_num = 0
    io.write ("\n")
    for _, param in pairs (args) do
      local pair = string_ex.split (param, " ")
      local type = pair[1]
      local name = pair[2]

      cur_num = cur_num + 1
      type = types.adatypes[type]

      if cur_num == 1 then
        io.write ("  (")
      else
        io.write ("   ")
      end

      io.write (name..[[ : ]]..type)

      if cur_num == num_args then
        io.write (")")
      else
        io.write (";\n")
      end
    end
  end

  io.write (" return "..types.adatypes[return_type]..";\n")
  io.write ([[pragma import (c, ]]..symbol_name..[[, "sqlite3_]]..symbol_name..[[");]])
  io.write ("\n")
  io.write ("\n")
end

for line in io.input():lines() do
  local args = string_ex.split (line, ":")
  local return_type = table.remove (args, 1)
  local symbol_name = table.remove (args, 1)

  if (return_type == "void") then
    handle_procedure (symbol_name, args)
  else
    handle_function (symbol_name, return_type, args)
  end
end
