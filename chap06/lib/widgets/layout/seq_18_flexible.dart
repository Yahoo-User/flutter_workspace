/*
  * =================================
  *   The `Flexible` Widget.
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
                  // const              // XX, (3)
                  MaterialApp(
                        home: Scaffold(
                              backgroundColor: Colors.white,

                               // -------------------------
                              appBar: AppBar(
                                    backgroundColor: Colors.amber,

                                    centerTitle: true,

                                    title: const Text("Flexible"),            // *const  for *Immutable object.
                                    titleTextStyle: const TextStyle(         // *const  for *Immutable object.
                                          color: Colors.black,
                                          letterSpacing: 5.0,
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                    ),

                                    titleSpacing: 10.0,

                                    toolbarHeight: 120.0,
                                    toolbarOpacity: 1.0,
                              ),

                              // -------------------------
                              body: Center(
                                    child: Column(
                                          // mainAxisSize: MainAxisSize.max,

                                          // mainAxisAlignment: MainAxisAlignment.start,            // Default
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          crossAxisAlignment: CrossAxisAlignment.center,        // Default

                                          children: [
                                                Flexible(
                                                      flex: 1,
                                                      // flex: 3,

                                                      fit: FlexFit.loose,           // Default: the child widget occupies only exact necessary space.    (***)

                                                      child: Container(
                                                            width: 300.0,
                                                            height: 100.0,        // *Important: *applied if `fit: FlexFit.loose`.       (***)

                                                            color: const Color.fromRGBO(184, 221, 147, 1.0),      // *const  for *Immutable object.
                                                      ),
                                                ),

                                                Flexible(
                                                      // flex: 1,
                                                      flex: 3,

                                                      fit: FlexFit.tight,           // The child widget occupies all remained space.      (***)

                                                      child: Container(
                                                            width: 300.0,
                                                            // height: 100.0,       // *Important: *not applied if `fit: FlexFit.tight`.       (***)

                                                            color: const Color.fromRGBO(174, 160, 217, 1.0),      // *const  for *Immutable object.
                                                      ),
                                                ),
                                          ],
                                    ),
                              ),
                        ),
                  );
      }
}

