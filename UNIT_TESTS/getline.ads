with ada.text_io;
with ada.strings.unbounded;

package getline is

  procedure get
    (file :  in ada.text_io.file_type;
     item : out ada.strings.unbounded.unbounded_string);

end getline;
