//  ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import '../classes/Stylize.dart';

//  Presenting the "Sheet" class version 1, used
//  to style a page of information.  See END NOTES
//  (at bottom) for tons of information!

class Sheet {
	
  //  this helper class starts with these default values
  static int index = 0;                                             //  0   -> the default sheet
  static bool show_back_button = true;                              //  should the back button be shown?
  static String headline = '';                      
  static List<String> line = [];
  static IconData button_icon = Icons.arrow_back;                   //  which icon to use (for the button) ?
  static String button_label = '';
  static String button_click_mssg = "";
  static Color button_border_color = Colors.transparent;
  static Color button_color = Colors.transparent;
  
  //  theme data ( colors to use, basically )
  static int theme = 0;
  static String theme_image_top_left = '';
  static String theme_image_top_right = '';
  static String theme_image_bottom_left = '';
  static String theme_image_bottom_right = '';

  //  style
  static style_name headline_font = style_name.heading1;
  static style_name fancy_font = style_name.fancy1;

  //  corner image
  static String corner_image_src = 'assets/images/sprite_peppermint.png';   
  static double corner_image_width = 130;
  static double corner_image_height = 180;
  
  
  //  ==============
  //  helper methods
  //  ==============

  static setTheme( [int num = 0] ) {
    if ( num == 0 ) {
      theme_image_top_left = 'fill_top_left_red';
      theme_image_top_right = 'fill_top_right_pink';
      theme_image_bottom_left = 'fill_bottom_left_pink';
      theme_image_bottom_right = 'fill_bottom_right_red'; 
      button_border_color = Color(0xFFf53c87);
      button_color = Color(0xFFe4015d);
      fancy_font = style_name.fancy1;   
    }
    else {
      theme_image_top_left = 'fill_top_left_blue';
      theme_image_top_right = 'fill_top_right_blue';
      theme_image_bottom_left = 'fill_bottom_left_ltpink';
      theme_image_bottom_right = 'fill_bottom_right_yellow'; 
      button_border_color = Color(0xFF4DE1fF);
      button_color = Color(0xFF2196f3);       
      fancy_font = style_name.fancy2;
    }
    return;
  }

  static void replaceSheet( int num ) {
    switch ( num ) {
      case 1:
        index = num;                                             
        show_back_button = false;                               
        headline = 'REMEMBER!';                      
        line = [
          'You can *NEVER*',
          'step in the *SAME* river',
          'twice, alrighty?'
        ];
        button_icon = Icons.check;                       
        button_label = 'S U R E';
        button_click_mssg = "clicked button for Sheet #" + num.toString();
        //  corner image
        corner_image_src = 'assets/images/sprite_peppermint.png';   
        corner_image_width = 130;
        corner_image_height = 180; 
        setTheme(1);    
      break;
      default: 
        index = 0;                                              
        show_back_button = true;                               
        headline = 'Game Aborted!';                      
        line = [
          '*OOPS!* When',
          'you quit a game it',
          'counts as a loss.'
        ];
        button_icon = Icons.arrow_back;                      //  which icon to use (for the button) ?
        button_label = 'H O M E';
        button_click_mssg = "clicked button for 'default' Sheet()";
        //  corner image
        corner_image_src = 'assets/images/sprite_tricky.png';   
        corner_image_width = 100;
        corner_image_height = 249; 
        setTheme(0);    
      break;
    }  
    return;
  } 



}
//  END NOTES
//  This is a helper class for Info_Page.dart.  This class contains all of the
//  information that is used by Info_Page to display an information screen.
//  In a buttshell, Info_Page grabs which Sheet it should use with
//  the replaceSheet() method, and this method sets up the static
//  vairables (like headline, button icon, etc.) to be displayed.