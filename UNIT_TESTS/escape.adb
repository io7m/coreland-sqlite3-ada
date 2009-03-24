with Ada.Command_Line;
with Ada.Text_IO;
with SQLite3.Utils;

procedure Escape is
  package IO renames Ada.Text_IO;
begin
  IO.Put_Line (Ada.Command_Line.Argument (1) & " => " & SQLite3.Utils.Escape (Ada.Command_Line.Argument (1)));
end Escape;
