with sqlite3.api;

pragma elaborate_all (sqlite3.api);

package rowdump is

  type int_access_t is access all integer;
  package sqlite3_api is new sqlite3.api
    (user_data_type => integer, user_data_access_type => int_access_t);

  procedure row_callback
    (column_names  : sqlite3_api.column_names_t;
     column_values : sqlite3_api.column_values_t;
     user_data     : int_access_t);

end rowdump;
