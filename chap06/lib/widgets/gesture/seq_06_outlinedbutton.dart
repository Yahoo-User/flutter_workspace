/*
  * =================================
  *   The `OutlinedButton` Widget.
  * =================================
  */

import 'package:flutter/material.dart';


void main() {
      runApp(const MyApp());

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

class MyApp extends StatelessWidget {     // abstract class StatelessWidget extends Widget

      const MyApp({super.key}) ;    // *const  for *Immutable object.


      @override
      Widget build(BuildContext context) {
            return MaterialApp(
                  home: Scaffold(
                        backgroundColor: Colors.white,

                        // -------------------------
                        appBar: AppBar(
                              backgroundColor: Colors.amber,
                              title: const Text("OutlinedButton"),      // *const  for *Immutable object.
                              centerTitle: true,
                              titleTextStyle: const TextStyle(    // *const  for *Immutable object.
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                              ),
                        ),

                        // -------------------------
                        body: Center(
                              child: OutlinedButton(        // *Target Widget
                                    onPressed: () => {},

                                    style: OutlinedButton.styleFrom(
                                          foregroundColor: Colors.purple,
                                    ),

                                    child: const Text(      // *const  for *Immutable object.
                                          "This is a OutlinedButton widget",

                                          style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                          ),
                                    ),
                              ),
                        ),
                  ),
            );
      }
}