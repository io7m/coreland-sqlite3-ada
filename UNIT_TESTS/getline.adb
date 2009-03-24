package body getline is

  procedure get
    (File : in Ada.Text_IO.File_Type;
     Item : out Ada.Strings.Unbounded.Unbounded_String)
  is
    Line : String (1 .. 128);
    Last : Natural;
  begin
    loop
      Ada.Text_IO.Get_Line
        (File => File,
         Item => Line,
         Last => Last);
      Ada.Strings.Unbounded.Append
        (Source   => Item,
         New_Item => Line (1 .. Last));
      exit when Last < Line'Last;
    end loop;
  end get;

end getline;
