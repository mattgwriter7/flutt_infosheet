// ignore_for_file: file_names, constant_identifier_names, non_constant_identifier_names

//  Presenting the "Config" class (version 1.0)
//  This class is for "global variables" used by
//  the app.

class Config {
  
  static const  String    app_name                  = "flutt_infosheet";
  static const  String    app_version               = "1.0.alpha.5";
  
  //  timeouts and delays
  static int              server_timeout            = 10;     // seconds
  static int              short_delay               = 500;    // milliseconds
  static int              long_delay                = 1500;   // milliseconds

  //  CUSTOM STUFF! (from here on this is stuff unique to this App)
  //  ... nuthin' here yet
  static int info_sheet_num = 1;
}