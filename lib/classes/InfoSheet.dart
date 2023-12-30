//  ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

//  Presenting the "InfoSheet" class version 1, used
//  to style a page of information.  See END NOTES
//  (at bottom) for tons of information!

class InfoSheet  {
	
  //  this hslper class starts with these default values
  static int index = 0;                                             //  0   -> the default sheet
  static bool show_back_button = true;                              //  should the back button be shown?
  static String heading_image = './assets/images/zigzag_01.png';    //  use a little decorating header image?
  static String headline = 'Game Aborted!';                      
  static List<String> line = [
    '*Oops?!* When',
    'you quit a game it',
    'counts as a loss.'
  ];
  static IconData button_icon = Icons.arrow_back;                      //  which icon to use (for the button) ?
  static String button_label = 'H O M E';
  static String button_click_mssg = "clicked button for 'default' InfoSheet()";
  static Color button_border_color = Color(0xFFf53c87);
  static Color button_color = Color(0xFFe4015d);
  
  //  these data ( colors to use, basically )
  static int theme = 0;
  static String theme_image_top_left = 'fill_top_left_red';
  static String theme_image_top_right = 'fill_top_right_pink';
  static String theme_image_bottom_left = 'fill_bottom_left_pink';
  static String theme_image_bottom_right = 'fill_bottom_right_red';


  //  helper methods

  static setTheme( [int num = 0] ) {
    if ( num == 0 ) {
      theme_image_top_left = 'fill_top_left_red';
      theme_image_top_right = 'fill_top_right_pink';
      theme_image_bottom_left = 'fill_bottom_left_pink';
      theme_image_bottom_right = 'fill_bottom_right_red'; 
      button_border_color = Color(0xFFf53c87);
      button_color = Color(0xFFe4015d);      
    }
    else {
      theme_image_top_left = 'fill_top_left_blue';
      theme_image_top_right = 'fill_top_right_blue';
      theme_image_bottom_left = 'fill_bottom_left_ltpink';
      theme_image_bottom_right = 'fill_bottom_right_yellow'; 
      button_border_color = Color(0xFF4DE1fF);
      button_color = Color(0xFF2196f3);       
    }
    return;
  }

  static void replaceInfoSheet( int num ) {
    switch ( num ) {
      case 1:
        index = num;                                             
        show_back_button = false;                               
        heading_image = './assets/images/zigzag_01.png';     
        headline = 'Boop!';                      
        line = [
          'You can *NEVER*',
          'step in the same river',
          'twice, alrighty?'
        ];
        button_icon = Icons.check;                       
        button_label = 'S U R E';
        button_click_mssg = "clicked button for InfoSheet #" + num.toString();
        setTheme(1);    
      break;
      default: 
        index = 0;                                              
        show_back_button = true;                               
        heading_image = './assets/images/zigzag_01.png';     
        headline = 'Game Aborted!';                      
        line = [
          '*Oops?!* When',
          'you quit a game it',
          'counts as a loss.'
        ];
        button_icon = Icons.ac_unit;                      //  which icon to use (for the button) ?
        button_label = 'H O M E';
        button_click_mssg = "clicked button for 'default' InfoSheet()";
        setTheme(0);    
      break;
    }  
    return;
  } 



}
//  END NOTES
//  This is a helper class for Info_Page.dart.  This class contains all of the
//  information that is used by Info_Page to display an information screen.
//  In a buttshell, Info_Page grabs which InfoSheet it should use with
//  the replaceInfoSheet() method, and this method sets up the static
//  vairables (like headline, button icon, etc.) to be displayed.