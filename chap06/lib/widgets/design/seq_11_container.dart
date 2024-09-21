/*
  * =================================
  *   The `Container` Widget.
  * =================================
  */

import '../../util/logger.dart';                      // Using relative path.
import 'package:flutter/material.dart';


void main() {
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

        App({super.key}) {
              console("Constructor($key) invoked.");
        }

        @override
        Widget build(BuildContext context) {
              console("build($context) invoked.");

              return
                    MaterialApp(
                          home: Scaffold(
                                backgroundColor: Colors.green,

                                // -------------------------
                                appBar: AppBar(
                                      backgroundColor: Colors.green,

                                      toolbarHeight: 133.0,
                                      toolbarOpacity: 1.0,

                                      title: const Text("HEADER\nCONTAINER"),   // *const  for *Immutable object.
                                      centerTitle: true,

                                      titleTextStyle:
                                            const TextStyle(    // *const  for *Immutable object.
                                                  fontSize: 28.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.white,
                                            ),
                                ) ,

                                // -------------------------
                                body: Center(
                                      child: Container(     // *Target Widget
                                            width: double.maxFinite ,
                                            height: double.maxFinite,

                                            decoration: BoxDecoration(
                                                  color: Colors.deepOrangeAccent,
                                                  border: Border.all(
                                                        width: 5.0,
                                                        color: Colors.greenAccent,
                                                        style: BorderStyle.solid,
                                                  ),
                                                  borderRadius: BorderRadius.circular(40.0),
                                            ),

                                            child: const Center(
                                                  child: Text(
                                                      "BODY",
                                                      style: TextStyle(
                                                            fontSize: 40.0,
                                                            fontWeight: FontWeight.bold,
                                                            fontStyle: FontStyle.normal,
                                                            color: Colors.white,
                                                      ),
                                                  ),
                                            ),
                                      ),
                                ) ,
                          ),
                    );
        }
}


