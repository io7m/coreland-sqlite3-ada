with ada.command_line;
with ada.text_io;
with sqlite3.utils;

procedure escape is
  package io renames ada.text_io;
begin
  io.put_line
    (ada.command_line.argument (1) & " => " &
     sqlite3.utils.escape (ada.command_line.argument (1)));
end escape;
