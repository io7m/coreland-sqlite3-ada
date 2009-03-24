with Ada.Command_Line;
with Ada.IO_Exceptions;
with Ada.Strings.Unbounded;
with Ada.Text_IO;

with rowdump;
with getline;

with SQLite3;
with SQLite3.Types;

procedure interp is
  package IO renames Ada.Text_IO;
  package US renames Ada.Strings.Unbounded;

  use type rowdump.SQLite3_API.Error_t;
  use type US.Unbounded_String;

  Database      : SQLite3.Types.Database_t;
  buffer        : US.Unbounded_String;
  Error_Message : US.Unbounded_String;
  exec_failed   : Boolean;
  x             : aliased Integer;

begin
  -- open database
  rowdump.SQLite3_API.Open
    (Database  => Database,
     File_Name => Ada.Command_Line.Argument (1));

  -- read SQL from stdin
  begin
    loop
      getline.get (IO.Current_Input, buffer);
    end loop;
  exception
    when Ada.IO_Exceptions.End_Error =>
      null;
  end;

  -- execute SQL
  rowdump.SQLite3_API.Exec
   (Database      => Database,
    SQL           => US.To_String (buffer),
    Error         => exec_failed,
    Callback      => rowdump.Row_Callback'Access,
    User_Data     => x'Unchecked_Access,
    Error_Message => Error_Message);
  if exec_failed then
    IO.Put_Line ("exec: " & US.To_String (Error_Message));
  end if;

  rowdump.SQLite3_API.Close (Database);

end interp;
