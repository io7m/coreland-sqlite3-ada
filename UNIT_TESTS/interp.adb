with ada.command_line;
with ada.io_exceptions;
with ada.strings.unbounded;
with ada.text_io;

with rowdump;
with getline;

with sqlite3;
with sqlite3.types;

procedure interp is
  package io renames ada.text_io;
  package us renames ada.strings.unbounded;

  use type rowdump.sqlite3_api.error_t;
  use type us.unbounded_string;

  database      : sqlite3.types.database_t;
  buffer        : us.unbounded_string;
  error_message : us.unbounded_string;
  exec_failed   : boolean;
  x             : aliased integer;

begin
  -- open database
  rowdump.sqlite3_api.open
    (filename => ada.command_line.argument (1),
     database => database);

  -- read SQL from stdin
  begin
    loop
      getline.get (io.current_input, buffer);
    end loop;
  exception
    when ada.io_exceptions.end_error => null;
  end;

  -- execute SQL
  rowdump.sqlite3_api.exec
    (database      => database,
     sql           => us.to_string (buffer),
     error         => exec_failed,
     callback      => rowdump.row_callback'access,
     user_data     => x'unchecked_access,
     error_message => error_message);
  if exec_failed then
    io.put_line ("exec: " & us.to_string (error_message));
  end if;

  rowdump.sqlite3_api.close (database => database);

end interp;
