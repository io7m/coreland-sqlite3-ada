package body getline is

  procedure get
    (file :  in ada.text_io.file_type;
     item : out ada.strings.unbounded.unbounded_string)
  is
    line : string (1 .. 128);
    last : natural;
  begin
    loop
      ada.text_io.get_line
        (item => line,
         last => last);
      ada.strings.unbounded.append
        (source   => item,
         new_item => line (1 .. last));
      exit when last < line'last;
    end loop;
  end get;

end getline;
