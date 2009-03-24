package body SQLite3.Utils is

  function Escape (Source : String) return String is
    Result : String (1 .. Source'Length * 2);
    Last   : Natural := 0;
  begin
    for Index in Source'Range loop
      if Source (Index) = ''' then
        Last := Last + 1;
        Result (Last) := ''';
      end if;
      Last := Last + 1;
      Result (Last) := Source (Index);
    end loop;
    return ''' & Result (1 .. Last) & ''';
  end Escape;

end SQLite3.Utils;
