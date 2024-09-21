/*
  * =================================
  *   The `SizedBox` Widget.
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

      // *Important: *const constructors can't have a *Body.
      // const                            // XX
      App({super.key}) {
            console("Constructor($key) invoked.");
      }

      @override
      Widget build(BuildContext context) {
            return
                  // *Important: the constructor being called isn't a *const constructor.
                  // const                    // XX
                  MaterialApp(            // *const  for *Immutable object.
                        home: Scaffold(
                              backgroundColor: Colors.white,

                              // -------------------------
                              appBar: AppBar(
                                    backgroundColor: Colors.amber,
                                    centerTitle: true,
                                    toolbarHeight: 200.0,
                                    toolbarOpacity: 1.0,

                                    title: const Text("SizedBox"),      // *const  for *Immutable object.

                                    titleTextStyle: const TextStyle(    // *const  for *Immutable object.
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black,
                                    ),
                              ),

                              // -------------------------
                              body: Center(
                                    child: SizedBox(        // *Target Widget
                                          width: 300,
                                          height: 300,

                                          child: Container(
                                                color: Colors.green,

                                                child: const Center(
                                                      child: Text(
                                                          "SIZED BOX",

                                                            style: TextStyle(
                                                                  fontSize: 30.0,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontStyle: FontStyle.normal,

                                                                  color: Colors.white,
                                                                  letterSpacing: 5.0,
                                                            ),
                                                      ),
                                                ),
                                          ),
                                    ),
                              ),
                        ),
                  );
      }
}

