/*
 * The template source to apply each new widget.
 */

import 'package:flutter/material.dart';


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

void main() {
      runApp(const MyApp());

      return;
}


class MyApp extends StatelessWidget {     // abstract class StatelessWidget extends Widget

      const MyApp({super.key});    // *const  for *Immutable object.


      @override
      Widget build(BuildContext context) {
            return  const MaterialApp(      // *const  for *Immutable object.
                  home: Scaffold(
                        backgroundColor: Colors.amber,

                        body: Center(

                              // Change the following widget of `child` named parameter.        <--- ***
                              child: Text("Hello, World!!!") ,

                        ),
                  ),
            );
      }
}


