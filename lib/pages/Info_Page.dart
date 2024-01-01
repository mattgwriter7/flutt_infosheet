// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import '../classes/Config.dart';
import '../classes/Sheet.dart';
import '../classes/Stylize.dart';
import '../classes/Utils.dart';

class Info_Page extends StatefulWidget {
  const Info_Page({ super.key });

  @override
  State createState() => _Info_PageState();
}

class _Info_PageState extends State<Info_Page> {

  _Info_PageState() {
    Utils.log( 'Info_Page.dart', 'init' );
  }

  // (this page) variables
  static const String filename = 'Info_Page.dart';
  double container_height = double.infinity;
  
  @override
  void initState() {
    super.initState();
    Utils.log( filename, 'initState()' );
    WidgetsBinding.instance.addPostFrameCallback((_) => _addPostFrameCallbackTriggered(context));

    // flip info sheet
    Config.info_sheet_num == 0 ? Config.info_sheet_num = 1 : Config.info_sheet_num = 0;
    Sheet.replaceSheet( Config.info_sheet_num );
  }

  @override
  void dispose() {
    Utils.log( filename, ' dispose()');
    super.dispose();
  }

  // (this page) methods
  void _buildTriggered() {
    Utils.log( filename, ' _buildTriggered()');
  }

  Widget displayTextInformation() {
    return SizedBox();
  }

  Container placeImage ( String str ) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "./assets/images/$str.png"),
          fit: BoxFit.fitHeight,
          //alignment: Alignment.topLeft,
        ),
        color: Colors.transparent,
      ),                  
      height: container_height,
      width: double.infinity,
    );
  }                  
  

  Row placeDecoration() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i=0 ; i < 10; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,8,18),
            child: Container(
              width: 10,
              height: 9,
              decoration: BoxDecoration(
                color: Sheet.button_color,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1,
                    blurRadius: 0,
                    offset: Offset(1, 1), // changes position of shadow
                  ),
                ],                
              ),
            ),
        ),
      ],
    );
  }   

  void buttonClicked( BuildContext context ) {
    Utils.log( filename, Sheet.button_click_mssg );
    //  WILLFIX: this needs a "mount", and a way to
    //  associate *this* click with a particule Sheet
    Future.delayed( Duration(milliseconds: Config.short_delay ), () async {
      if(mounted) Navigator.of(context).popUntil((ModalRoute.withName ('Start_Page')));
      return;
    }); 
  }

  void _addPostFrameCallbackTriggered( context ) {
    Utils.log( filename, ' _addPostFrameCallbackTriggered()');
  }

  // (this page) build
  @override
  Widget build(BuildContext context) {

    _buildTriggered();

    return WillPopScope(
      onWillPop: () async {
        if ( Sheet.show_back_button ) {
          buttonClicked( context );
        }
        return false;  //  disable back button altogether!! ( though it may be used with buttonClicked() above this ^^ )
      },
      child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,  
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: const Text( '' ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: Sheet.show_back_button,
            ), //AppBar
            // drawer: Drawer_Widget(),
            body: Container(
              color: Colors.transparent,
              child: Stack(
                  children: [
                    placeImage(Sheet.theme_image_top_right),
                    placeImage(Sheet.theme_image_top_left),
                    placeImage(Sheet.theme_image_bottom_left),
                    placeImage(Sheet.theme_image_bottom_right),

                    //  START OF THE INFORMATION
                    //  (heading image, headline, text, button, etc.)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //  = Heading Image =  
                        placeDecoration(),
                        /*
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,0,10),
                          child: Container(
                            width: 180,
                            height: 30,
                            decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                AssetImage( Sheet.heading_image ),
                                fit: BoxFit.fitWidth,
                                //alignment: Alignment.center,
                              ),
                            ),   
                          ),
                        ),
                        */

                        //  = Headline =                      
                        Stylize.lineStyler( Sheet.headline, style: style_name.heading1 ),

                        //  = Lines of Text = 
                        for (var i = 0; i < Sheet.line.length ; i++) ...[
                          Stylize.lineStyler( Sheet.line[i], style: Sheet.fancy_font )
                        ],

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,20,0,0),
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                  child: SizedBox(
                                    height: 90,
                                    width: 90,
                                    child: ElevatedButton.icon(
                                      icon: Icon(
                                        Sheet.button_icon,
                                        color: Colors.white,
                                        size: 65.0,
                                      ),
                                      label: Text('',  style: TextStyle( fontSize: 1, fontWeight: FontWeight.normal,  )),
                                      onPressed: () {
                                        buttonClicked( context );                        
                                      }, 
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ), 
                                        backgroundColor: Sheet.button_color,
                                        side: BorderSide(
                                          width: 5, // the thickness
                                          color: Sheet.button_border_color, // the color of the border
                                        ),
                                        padding: EdgeInsets.fromLTRB(7,5,0,5),
                                        elevation: 5,
                                        shadowColor: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text( Sheet.button_label, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black,  ),),
                                ),
                                /*
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(135,20,135,0),
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                        AssetImage('./assets/images/zigzag_01.png'),
                                        fit: BoxFit.fitHeight,
                                        //alignment: Alignment.center,
                                      ),
                                    ),   
                                  ),
                                ),
                                */                              
                              ],
                            ), 
                          ),
                        )
                      ],
                    ),

                    Positioned(
                      right: 15,
                      bottom: 15,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: SizedBox(
                        width: Sheet.corner_image_width,
                        height: Sheet.corner_image_height,
                        child:Image.asset( Sheet.corner_image_src ),
                        ),
                      ),
                    ),
                  ],  
                ),                  
              ),
          ),
        ),
    );
  }
}

