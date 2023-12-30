// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import '../classes/Config.dart';
import '../classes/Stylize.dart';
import '../classes/Utils.dart';

class Start_Page extends StatefulWidget {
  const Start_Page({ super.key });

  @override
  State createState() => _Start_PageState();
}

class _Start_PageState extends State<Start_Page> {

  _Start_PageState() {
    Utils.log( 'Start_Page.dart', 'init' );
  }

  // (this page) variables
  static const String filename = 'Start_Page.dart';
  double container_height = double.infinity;
  List<String> line = ['Game Aborted!','*Oops!* When','you quit a game it','counts as a loss.'];   //  an array for the line/columns to display
  
  @override
  void initState() {
    super.initState();
    Utils.log( filename, 'initState()' );
    WidgetsBinding.instance.addPostFrameCallback((_) => _addPostFrameCallbackTriggered(context));
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,20),
          child: Container(
            width: 180,
            height: 30,
            decoration: BoxDecoration(
            image: DecorationImage(
              image:
                AssetImage('./assets/images/zigzag_01.png'),
                fit: BoxFit.fitWidth,
                //alignment: Alignment.center,
              ),
            ),   
          ),
        ),
                              
      
        for (var i = 0; i < line.length ; i++) ...[
          i == 0 ? Stylize.lineStyler( line[i], style: style_name.heading1 )
          : Stylize.lineStyler( line[i], style: style_name.fancy1 )
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
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 65.0,
                      ),
                      label: Text('',  style: TextStyle( fontSize: 1, fontWeight: FontWeight.normal,  )),
                      onPressed: () {
                        Utils.log( filename,' clicked butt ');
                        Future.delayed( Duration(milliseconds: Config.short_delay ), () async {
                          Navigator.of(context).popUntil((ModalRoute.withName ('Start_Page')));
                          return;
                        });                         
                      }, 
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        side: const BorderSide(
                          width: 5, // the thickness
                          color: Color(0xFF4DE1fF), // the color of the border
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
                  child: Text('B A C K', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black,  ),),
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
    );
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
      //  color: Colors.white,
      //  child: insertLineStyler(),
    );
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
        return true;  //  this allows the back button to work
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
            ), //AppBar
            // drawer: Drawer_Widget(),
            body: Container(
              color: Colors.transparent,
              child: Stack(
                  children: [
                    placeImage('fill_top_right_pink'),
                    placeImage('fill_top_left_red'),
                    placeImage('fill_bottom_left_pink'),
                    placeImage('fill_bottom_right_red'),
                    displayTextInformation(),
                  ],  
                ),                  
              ),
          ),
        ),
    );
  }
}

