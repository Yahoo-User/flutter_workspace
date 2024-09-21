/*
  * =================================
  *   The `Expanded` Widget.
  * =================================
  */


import '../../util/logger.dart';
import 'package:flutter/material.dart';


void main() {
      console("main() invoked.");

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

      // const                    // XX, (4)
      App({super.key}) {
            console("Constructor($key) invoked.");
      }


      @override
      Widget build(BuildContext context) {
            console("build($context) invoked.");

            return
                  // const        // XX, (3)
                  MaterialApp(
                        home: Scaffold(
                              backgroundColor: Colors.white,

                              // -------------------------
                              appBar: AppBar(
                                    backgroundColor: Colors.amber,

                                    centerTitle: true,

                                    title: const Text("Expanded"),      // *const  for *Immutable object.

                                    titleTextStyle: const TextStyle(      // *const  for *Immutable object.
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: 5.0,

                                          color: Colors.black,
                                    ),

                                    toolbarHeight: 100.0,
                                    toolbarOpacity: 1.0,
                              ),

                              // -------------------------
                              body: Center(
                                    child: Column(
                                          mainAxisSize: MainAxisSize.max,

                                          mainAxisAlignment: MainAxisAlignment.start,            // Default
                                          crossAxisAlignment: CrossAxisAlignment.center,        // Default

                                          children: [
                                                Expanded(         // **Target Widget
                                                      flex: 3,

                                                      child: Container(
                                                          width: 300.0,
                                                          // height: 300.0,            // *Important: *not applied.     (***)

                                                          color: Colors.blue,
                                                    ),
                                                ),

                                                Expanded(         // **Target Widget
                                                      flex: 1,

                                                      child: Container(
                                                          width: 300.0,
                                                          // height: 300.0,            // *Important: *not applied.     (***)

                                                          color: Colors.red,
                                                    ) ,
                                                ),
                                          ],
                                    ),
                              ),
                        ),
                  );
      }
}

