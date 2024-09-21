/*
  * =================================
  *   Margin & Padding
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

      // const                    // XX, (4)
      App({super.key}) {
            console("Constructor($key) invoked.");
      }


      @override
      Widget build(BuildContext context) {
            return
                  MaterialApp(
                        home: Scaffold(
                              backgroundColor: Colors.white,

                              // -------------------------
                              appBar: AppBar(
                                    backgroundColor: Colors.orangeAccent,

                                    centerTitle: true,
                                    title: const Text("Margin & Padding"),

                                    titleTextStyle: const TextStyle(
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black,
                                    ),

                                    toolbarHeight: 100.0,
                                    toolbarOpacity: 1.0,
                              ),

                              // -------------------------
                              body: Center(
                                    child: Container(       // Container - 1
                                          color: Colors.red,

                                          // 1st. Target.   <--- ***
                                          margin: const EdgeInsets.all(30),                                                                    // 1st. method
                                          // margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),                // 2nd. method
                                          // margin: const EdgeInsets.only(top: 10, right: 20, bottom: 30, left: 40),        // 3rd. method
                                          // margin: const EdgeInsets.fromLTRB(10, 20, 30, 40),                                     // 4th. method

                                          // 2nd. Target.   <--- ***
                                          padding: EdgeInsets.zero,                                                                                // 1st. method
                                          // padding: const EdgeInsets.all(30),                                                                  // 2nd. method
                                          // padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),               // 3rd. method
                                          // padding: const EdgeInsets.only(top: 10, right: 20, bottom: 30, left: 40),       // 4th. method
                                          // padding: const EdgeInsets.fromLTRB(10, 20, 30, 40),                                   // 5th. method


                                          // *Important: the 'child' argument should be last in widget constructor invocations.
                                          child: Container(       // Container - 2
                                                color: Colors.green,

                                                margin: const EdgeInsets.all(30),            // 1st. Target.   <--- ***
                                                padding: EdgeInsets.zero,                       // 2nd. Target.   <--- ***

                                                // *Important: the 'child' argument should be last in widget constructor invocations.
                                                child: Container(       // Container - 3
                                                      color: Colors.blue,

                                                      margin: const EdgeInsets.all(30),            // 1st. Target.   <--- ***
                                                      padding: EdgeInsets.zero,                       // 2nd. Target.   <--- ***
                                                ),
                                          ),
                                    ),
                              ),
                        ),
                  );
      }
}