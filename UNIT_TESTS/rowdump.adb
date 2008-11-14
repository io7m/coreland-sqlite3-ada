with ada.strings.unbounded;
with ada.text_io;
with sqlite3;

package body rowdump is
  package io renames ada.text_io;
  package us renames ada.strings.unbounded;

  procedure row_callback
    (column_names  : sqlite3_api.column_names_t;
     column_values : sqlite3_api.column_values_t;
     user_data     : int_access_t) is
  begin
    io.put_line ("-- row start");
    for index in column_names'range loop
      io.put_line
        (us.to_string (column_names (index)) & "|" &
         us.to_string (column_values (index)));
    end loop;
    io.put_line ("-- row end");
  end row_callback;

end rowdump;
