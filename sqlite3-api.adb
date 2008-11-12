with interfaces.c;
with interfaces.c.strings;
with sqlite3.constants;
with sqlite3.thin;

package body sqlite3.api is
  package c renames interfaces.c;
  package cs renames interfaces.c.strings;

  use type cs.chars_ptr;
  use type sqlite3.types.int_t;

  procedure open
    (filename : string;
     database : out sqlite3.types.database_t)
  is
    fn : aliased c.char_array := c.to_c (filename);
    db : aliased sqlite3.types.database_t;
    ec : constant sqlite3.types.int_t := sqlite3.thin.open
      (file => cs.to_chars_ptr (fn'unchecked_access),
       db   => db'unchecked_access);
  begin
    database := db;
    if ec /= sqlite3.constants.sqlite_ok then
      raise database_error with error_message (database);
    end if;
  end open;

  procedure exec
    (database      : sqlite3.types.database_t;
     sql           : string;
     error         : out boolean;
     error_message : out us.unbounded_string)
  is
    sq : aliased c.char_array := c.to_c (sql);
    em : aliased cs.chars_ptr;
    pragma warnings (off); -- discarding constant
    ec : constant sqlite3.types.int_t := sqlite3.thin.exec
      (db            => database,
       sql           => cs.to_chars_ptr (sq'unchecked_access),
       callback      => null,
       context       => sqlite3.types.null_ptr,
       error_message => em'unchecked_access);
    pragma warnings (on);
  begin
    if em /= cs.null_ptr then
      us.set_unbounded_string (error_message, cs.value (em));
      error := true;
      cs.free (em);
    end if;
  end exec;

  procedure close
    (database : sqlite3.types.database_t)
  is
    ec : constant sqlite3.types.int_t := sqlite3.thin.close
      (sql => database);
  begin
    if ec /= sqlite3.constants.sqlite_ok then
      raise database_error with error_message (database);
    end if;
  end close;

  function error_message
    (database : sqlite3.types.database_t) return string is
  begin
    return cs.value (sqlite3.thin.errmsg (database));
  end error_message;

end sqlite3.api;
