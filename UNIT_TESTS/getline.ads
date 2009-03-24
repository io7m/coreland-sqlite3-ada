with Ada.Text_IO;
with Ada.Strings.Unbounded;

package getline is

  procedure get
    (File : in Ada.Text_IO.File_Type;
     Item : out Ada.Strings.Unbounded.Unbounded_String);

end getline;
