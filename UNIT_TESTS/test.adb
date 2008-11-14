with ada.text_io;

package body test is
  package io renames ada.text_io;

  procedure sys_exit (ecode : integer);
  pragma import (c, sys_exit, "exit");

  procedure assert
    (check        : in boolean;
     pass_message : in string := "assertion passed";
     fail_message : in string := "assertion failed") is
  begin
    if check then
      io.put_line (io.current_error, "pass: " & pass_message);
    else
      io.put_line (io.current_error, "fail: " & fail_message);
      sys_exit (1);
    end if;
  end assert;

end test;
