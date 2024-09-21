/*
  * =================================
  *   The `GestureDetector` Widget.
  * =================================
  */

import 'package:chap06/util/logger.dart';       // Using absolute path.
import 'package:flutter/material.dart';


void main() {
      runApp(const App());    // *const  for *Immutable object.

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

      const App({super.key});       // *const  for *Immutable object.


      @override
      Widget build(BuildContext context) {
            return
                  MaterialApp(
                        home: Scaffold(
                              backgroundColor: Colors.white,

                              // -------------------------
                              appBar: AppBar(
                                    backgroundColor: Colors.amber,
                                    title: const Text("GestureDetector"),     // *const  for *Immutable object.
                                    centerTitle: true,
                                    titleTextStyle: const TextStyle(    // *const  for *Immutable object.
                                          color: Colors.black,
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                    ),
                              ),

                              // -------------------------
                            body: Center(
                                  child: GestureDetector(   // *Target Widget
                                          child: Container(
                                                decoration: const BoxDecoration(    // *const  for *Immutable object.
                                                      color: Colors.purple,
                                                ),

                                                width: 200.0,
                                                height: 200.0,

                                                child: const Center(    // *const  for *Immutable object.
                                                      child: Text(
                                                          "Container",
                                                            style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontStyle: FontStyle.italic,
                                                                  fontSize: 22.0,
                                                                  fontWeight: FontWeight.bold,
                                                            ),
                                                      ),
                                                ),
                                          ),

                                        // Callbacks on some gesture events,
                                        onTap: () => console("Tapped."),
                                        onDoubleTap: () => console("Double tapped."),
                                        onLongPress: () => console("Long pressed."),
                                  ),
                            ) ,
                        ),
                  );
        }
}

