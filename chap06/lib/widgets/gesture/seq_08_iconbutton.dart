/*
  * =================================
  *   The `IconButton` Widget.
  * =================================
  */

import 'package:flutter/material.dart';


void main() {
      runApp(const App());

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
                                    title: const Text("IconButton"),    // *const  for *Immutable object.
                                    centerTitle: true,
                                    titleTextStyle: const TextStyle(          // *const  for *Immutable object.
                                          color: Colors.black,
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                    ),
                              ),

                              // -------------------------
                              body: Center(
                                    child: IconButton(      // *Target Widget
                                          color: Colors.deepOrange,
                                          iconSize: 44.0,

                                          onPressed: () => {},

                                          icon: const Icon(       // *const  for *Immutable object.
                                                // Icons.home,
                                                // Icons.home_filled,
                                                // Icons.home_outlined,
                                                // Icons.home_max,
                                                // Icons.home_max_outlined,
                                                Icons.home_max_rounded,
                                                // Icons.home_max_sharp,
                                                // Icons.home_work,
                                                // Icons.home_work_rounded,
                                          ),
                                    ),
                              ),
                        ),
                  );
      }
}

