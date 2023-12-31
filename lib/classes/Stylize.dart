//  ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

//  Presenting the "Stylize" class version 2, used
//  to style a row of text. END NOTES at the bottom...

class Stylize {

  // (this page) methods
  static const String filename = 'Stylize.dart';


  //  =======================================================
  //  lineStyler() : 
  //  break a line of text into words, then
  //  style it accordingly, returning Text or a Row (of text)
  //  ======================================================= 
  static Padding lineStyler( String ln,  { style_name style = style_name.normal } ) {
    bool isHeading = false;
    if ( style == style_name.heading1 ) {
      isHeading = true;
    }
    if ( isHeading ) {
      return Padding (padding: const EdgeInsets.fromLTRB(0,0,0,20),
                    child: Text( ln, style: styleFont( style ) ));
    }
    else {
      final splitted = ln.split(' ');
      //  WILLFIX: trim array here
      Row new_row = addRow( splitted, style: style );
      return Padding(
        padding: const EdgeInsets.fromLTRB(0,0,0,15),
        child: new_row,
      );
    }
  }  

            //  helper method for lineStyler() 
            static bool isStarred( String str) {
              String first_char = str.substring(0, 1);;
              String last_char = str.substring(str.length - 1);
              if( first_char == '*' && last_char == '*') {
                return true;
              }
              else {
                return false;
              }
            }

            //  helper method for lineStyler()  
            static String trimStars( String str) {
              return str.substring(1,str.length - 1);
            }  
            //  =======================================
            //  addRow() : 
            //  is a helper method for lineStyler() that
            //  returns a row made up of (styled) words
            //  =======================================
            static Row addRow( List<String> arr,  { style_name style = style_name.normal } ) {
              int length = arr.length;
              String trimmed;
              return Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate( length, (index) {
                //  look to see if a word is starred like *this!!*  
                if ( isStarred(arr[index])) {
                  trimmed = trimStars(arr[index]);
                  return Text( trimmed, style: styleFont( style ) );
                }
                else {
                  return Text( ' ' + arr[index] + ' ', style: styleFont( style_name.normal ) );
                } 
                })
              );
            }

  //  This returns a headline (and an optional subheadline )
  static Column headline( String headline, [ String subheadline = '', String img = '' ] ) {
    if ( subheadline == '' ) {
      return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //  START OF STYLED TEXT
        Stylize.lineStyler( headline, style: style_name.heading1 ),
      ]);       
    }
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //  START OF STYLED TEXT
      Stylize.lineStyler( headline, style: style_name.heading1 ),
      Stylize.lineStyler( subheadline, style: style_name.fancy2 ),
      img != '' ?
      Padding(
        padding: const EdgeInsets.fromLTRB(0,15,0,20),
        child: Container(
          width: 120,
          height: 120,
          child: Image.asset('assets/images/$img'),
        ),
      ) : SizedBox( height: 1),    
    ]);      
  }

  //  =======================================================
  //  TextStyle() : 
  //  ======================================================= 
  static TextStyle? styleFont ( style_name s ) {
    switch( s ) {
      case style_name.heading1:
        return const TextStyle(
          fontSize: 36,
          //  fontWeight: FontWeight.bold,
          fontFamily: 'Headline1',
          //  decoration: TextDecoration.underline,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Colors.grey,
            ),
          ],          
        );
      case style_name.fancy1:
        return const TextStyle(
          fontSize: 26,
          letterSpacing: 3,
          fontWeight: FontWeight.bold,
          color: Color(0xFFf53c87), // 
          fontFamily: 'Mono1',
          shadows: <Shadow>[
            Shadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 2.0,
              color: Colors.black,
            ),
          ],  // CourierPrime-Bold.ttf
          /*
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy,          
          */
        ); 
      case style_name.fancy2:
        return const TextStyle(
          fontSize: 26,
          letterSpacing: 3,
          fontWeight: FontWeight.bold,
          color: Colors.grey, // 
          fontFamily: 'Mono1',
          shadows: <Shadow>[
            Shadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 2.0,
              color: Colors.black,
            ),
          ],
        );                
      default:  // normal
        return const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        );
    }
	}
}

//  style_name is an enum used for pre-defined styles
enum style_name {
   heading1,
   normal,
   fancy1,
   fancy2,
}
//  END NOTES
//  I made this class to replace HTML webviews for informational text.
//  Basically, it will take a line of text and style it if
//  a word is starred like *this*.  When a word is starred it
//  will "Stylize" that word according to an enum called
//  style_name. (just above)
//  This enum uses a styleFont() method to return a TextStyle which
//  is defined just above the enum.
//
//  There are 2 main methods:
//    1. Stylize.lineStyler (for a single line of style text)
//    2. Stylize.headline (headline, and optional subhead and image)
//  LineStyler will return a Row() with padding around it (where
//  each word is a Text() fragment), and
//  headline returns a Column() with headline, sub, img stacked