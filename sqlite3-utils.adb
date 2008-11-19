package body sqlite3.utils is

  function escape (source : string) return string is
    result : string (1 .. source'length * 2);
    last   : natural := 0;
  begin
    for i in source'range loop
      if source (i) = ''' then
        last := last + 1;
        result (last) := ''';
      end if;
      last := last + 1;
      result (last) := source (i);
    end loop;
    return ''' & result (1 .. last) & ''';
  end escape;

end sqlite3.utils;
