/*
  * =================================
  *   The `Column` Widget.
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

      // const                      // XX, (4)
      App({super.key}) {
            console("Constructor($key) invoked.");
      }


      @override
      Widget build(BuildContext context) {
            console("build($context) invoked.");

            return
                // const            // XX, (3)
                MaterialApp(
                        home: Scaffold(
                              backgroundColor: Colors.white,

                              // -------------------------
                              appBar: AppBar(
                                    backgroundColor: Colors.amber,

                                    centerTitle: true,

                                    title: const Text("Column"),        // *const  for *Immutable object.
                                    titleTextStyle: const TextStyle(    // *const  for *Immutable object.
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: 5.0,

                                          color: Colors.black,
                                    ),

                                    toolbarHeight: 120.0,
                                    toolbarOpacity: 1.0,
                              ),


                              // -------------------------
                              body: SizedBox(
                                    width: double.maxFinite,      // For cross axis space.

                                    child: Column(    // ***Target Widget

                                          // (1) Set Main Axis Alignment Options.
                                          // mainAxisAlignment: MainAxisAlignment.start,                          // Default
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          // mainAxisAlignment: MainAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                          // (2) Set Cross Axis Alignment Options.
                                          crossAxisAlignment: CrossAxisAlignment.center,                          // Default
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.end,
                                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                                          // crossAxisAlignment: CrossAxisAlignment.baseline,               // XX

                                          // (3) Define Children Widgets.
                                          children: [
                                                Container(
                                                      width: 70.0,
                                                      height: 70.0,
                                                      color: Colors.red,
                                                ),

                                                const
                                                // The `SizedBox` widget is generally used to make empty space between two widgets. (***)
                                                SizedBox(height: 30.0,),      // *const  for *Immutable object.

                                                Container(
                                                      width: 70.0,
                                                      height: 70.0,
                                                      color: Colors.green,
                                                ),

                                                const
                                                // The `SizedBox` widget is generally used to make empty space between two widgets. (***)
                                                SizedBox(height: 30.0,),      // *const  for *Immutable object.

                                                Container(
                                                      width: 70.0,
                                                      height: 70.0,
                                                      color: Colors.blue,
                                                )
                                          ],

                                    ),
                              ),
                        ),
                );
      }
}