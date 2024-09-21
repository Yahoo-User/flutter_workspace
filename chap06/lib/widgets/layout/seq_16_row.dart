/*
  * =================================
  *   The `Row` Widget.
  * =================================
  */

import '../../util/logger.dart';                      // Using relative path.
import 'package:flutter/material.dart';


void main( ) {
      console("main() invoked.");

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
            console("build($context) invoked.");

            return
                  // const                      // XX, (3)
                  MaterialApp(
                        home: Scaffold(
                              backgroundColor: Colors.white,   // *const  for *Immutable object.

                              // -------------------------
                              appBar: AppBar(
                                    backgroundColor:  Colors.amber,

                                    centerTitle: true,

                                    title: const Text("Row"),     // *const  for *Immutable object.
                                    titleTextStyle: const TextStyle(    // *const  for *Immutable object.
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: 5.0,

                                          color: Colors.black,
                                    ),

                                    toolbarHeight: 100.0,
                                    toolbarOpacity: 1.0,
                              ),

                              // -------------------------
                              body: SizedBox(
                                    height: double.maxFinite ,     // For cross axis space.

                                    child: Row(       // ***Target Widget

                                          // (1) Set main axis alignment option
                                          mainAxisAlignment: MainAxisAlignment.start,                      //   1,  (default)
                                          // mainAxisAlignment: MainAxisAlignment.center,                   //   2
                                          // mainAxisAlignment: MainAxisAlignment.end,                       //   3
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,      //   4
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,        //   5
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,         //   6

                                          // (2) Set cross axis alignment option
                                          crossAxisAlignment: CrossAxisAlignment.center,                 //  1, (default)
                                          // crossAxisAlignment: CrossAxisAlignment.start,                   //   2
                                          // crossAxisAlignment: CrossAxisAlignment.end,                    //   3
                                          // crossAxisAlignment: CrossAxisAlignment.stretch,              //    4
                                          // crossAxisAlignment: CrossAxisAlignment.baseline,                //    XX

                                          // (3) Define children widgets.
                                          children: [
                                                Container(  // 1st. Child Widget
                                                      width: 70.0,
                                                      height: 70.0,
                                                      color: Colors.red,
                                                ),

                                                // The `SizedBox` widget is generally used to make empty space between two widgets. (***)
                                                const
                                                SizedBox(width: 30.0,),       // *const  for *Immutable object.

                                                Container(  // 2nd. Child Widget
                                                      width: 70.0,
                                                      height: 70.0,
                                                      color: Colors.green,
                                                ),

                                                // The `SizedBox` widget is generally used to make empty space between two widgets. (***)
                                                const
                                                SizedBox(width: 30.0,),       // *const  for *Immutable object.

                                                Container(  // 3rd. Child Widget
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


