with SQLite3.API;

pragma Elaborate_All (SQLite3.API);

package rowdump is

  type Int_Access_t is access all Integer;

  package SQLite3_API is new SQLite3.API
    (User_Data_Type        => Integer,
     User_Data_Access_Type => Int_Access_t);

  procedure Row_Callback
    (Column_Names  : SQLite3_API.Column_Names_t;
     Column_Values : SQLite3_API.Column_Values_t;
     User_Data     : Int_Access_t);

end rowdump;
