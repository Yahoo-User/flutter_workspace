/*
 * In the flutter, all widgets could be divided into 2-type widgets:
 *
 *    (1) with `child` named parameter.
 *    (2) with `children` named parameter.                  <--- ***
 *
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
      runApp(
            const
            MaterialApp(     // *const  for *Immutable object.
                  home: Scaffold(
                        backgroundColor: Colors.amber,

                        body: SizedBox(
                              width: double.infinity,
                              child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Text>[
                                          Text("Code"),
                                          Text("Factory")
                                    ],
                              ),
                        ),
                  ),
            )
      ); // runApp

      return;
}

