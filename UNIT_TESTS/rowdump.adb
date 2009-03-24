with Ada.Strings.Unbounded;
with Ada.Text_IO;
with SQLite3;

package body rowdump is
  package IO renames Ada.Text_IO;
  package US renames Ada.Strings.Unbounded;

  procedure Row_Callback
    (Column_Names  : SQLite3_API.Column_Names_t;
     Column_Values : SQLite3_API.Column_Values_t;
     User_Data     : Int_Access_t)
  is
    pragma Assert (User_Data /= null);
  begin
    IO.Put_Line ("-- row start");
    for Index in Column_Names'Range loop
      IO.Put_Line
        (US.To_String (Column_Names (Index)) & "|" &
         US.To_String (Column_Values (Index)));
    end loop;
    IO.Put_Line ("-- row end");
  end Row_Callback;

end rowdump;
