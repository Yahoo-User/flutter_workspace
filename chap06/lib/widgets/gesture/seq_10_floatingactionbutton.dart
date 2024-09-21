/*
  * =================================
  *   The `FloatingActionButton` Widget.
  * =================================
  */

import '../../util/logger.dart';                         // Using relative path.
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

      // *Important: *Const constructors can't have a *Body.
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
                              backgroundColor: Colors.white,

                              // -------------------------
                              appBar: AppBar(
                                    backgroundColor: Colors.amber,
                                    title: const Text("FloatingActionButton"),      // *const  for *Immutable object.
                                    centerTitle: true,
                                    titleTextStyle: const TextStyle(    // *const  for *Immutable object.
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'D2Coding',
                                          color: Colors.black,
                                    ),
                                    toolbarHeight: 150.0,
                                    toolbarOpacity: .57,
                              ),

                              // -------------------------
                              // *Important: floating action button in the right-bottom fixed position of screen.
                              // -------------------------
                              floatingActionButton: FloatingActionButton(     // *Target Widget
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.purple,

                                    // When testing, press Tab key in several.      (***)
                                    focusColor: Colors.red,

                                    autofocus: true,
                                    mouseCursor: SystemMouseCursors.grab ,

                                    onPressed: () => console("Pressed ..."),

                                    // *Important: the *child argument should be *LAST in widget constructor invocations.

                                    // *const  for *Immutable object.
                                    // child: const Text("Click"),      // 1st. Text
                                    child: const Icon(Icons.home_max_rounded),      // 2nd. Icon Image
                              ),
                        ),
            );
      }
}


