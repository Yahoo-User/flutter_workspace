/*
  * =================================
  *   The `Padding` Widget.
  * =================================
  */

import '../../util/logger.dart';                      // Using relative path.
import 'package:flutter/material.dart';


void main(List<String> args) {
      runApp(App());

      return;
}


/*
  *  ============================
  *   **Const Constructor
  *  ============================
  *    (1) When compiling, the instance is created from this.
  *    (2) This makes an Immutable object.       (***)
  *    (3) The constructor being called couldn't be a *const constructor.       (***)
  *    (4) This can't have a *body with bracket symbol '{}'.      (***)
  *  ============================
  */

class App extends StatelessWidget {

      // const                      // XX
      App({super.key}) {
            console("Constructor($key) invoked.");
      }


      @override
      Widget build(BuildContext context) {
            console("build($context) invoked.");

            return
                  MaterialApp(
                        home: Scaffold(
                              backgroundColor: Colors.grey,

                              // -------------------------
                              appBar:AppBar(
                                    backgroundColor: Colors.amberAccent,

                                    centerTitle: true,
                                    title: const Text("Padding"),       // *const  for *Immutable object.
                                    titleTextStyle: const TextStyle(    // *const  for *Immutable object.
                                          fontSize: 35.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                    ),

                                    toolbarOpacity: 1.0,
                                    toolbarHeight: 130.0,
                              ) ,

                              // -------------------------
                              body: Center(
                                    child: Container(
                                          color: Colors.green,

                                          child: Padding(   // *Target Widget

                                                // *Target: apply padding equally by Top/Right/Bottom/Left directions.   (***)
                                                padding: const EdgeInsets.all(50.0),      // *const  for *Immutable object.

                                                child: Container(
                                                      width: 200.0,
                                                      height: 200.0,

                                                      color: Colors.blue,

                                                      child: const Icon(      // *const  for *Immutable object.
                                                            Icons.home_max_rounded,
                                                            size: 40.0,
                                                      )
                                                ),
                                          ),
                                    ),
                              ),
                        ),
                  );
      }
}




