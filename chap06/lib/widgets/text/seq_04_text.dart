/*
  * =================================
  *   The `Text` Widget.
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

        const MyApp({super.key});    // *const  for *Immutable object.


        @override
        Widget build(BuildContext context) {
              return  MaterialApp(
                    home: Scaffold(
                          backgroundColor: Colors.white,

                          // -------------------------
                          appBar: AppBar(
                                backgroundColor: Colors.amber,

                                centerTitle: true,

                                title: const Text("Text"),        // *const  for *Immutable object.
                                titleTextStyle: const TextStyle(        // *const  for *Immutable object.
                                      fontSize: 34.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: 5.0,

                                      color: Colors.black,
                                ),

                          ),

                          // -------------------------
                          body: const Center(   // *const  for *Immutable object.
                                child: Text(          // *Target Widget
                                      "This is a Text widget",

                                      style: TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            letterSpacing: 2.0,

                                            color: Colors.red,
                                      ),
                                ),
                          ),
                    ),
              );
        }
}