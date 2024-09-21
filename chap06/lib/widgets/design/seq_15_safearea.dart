/*
  * =================================
  *   The `SafeArea` Widget.
  * =================================
  */

import '../../util/logger.dart';                    // Using relative path.
import 'package:flutter/material.dart';


void main(List<String> args) {
      console("main($args, ${args.length}) invoked.");

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
            console("App($key) invoked.");
      }


      @override
      Widget build(BuildContext context) {
            console("build($context) invoked.");

            return
                  // const                // XX,   (3)
                  MaterialApp(
                        home: Scaffold(
                              backgroundColor:  const Color.fromRGBO(255, 255, 255, 1.0),       // *const  for *Immutable object.

                              // -------------------------
                             /* appBar: AppBar(
                                    backgroundColor:
                                          const Color.fromRGBO(60, 63, 65, 1.0),    // *const  for *Immutable object.

                                    centerTitle: true,
                                    title: const Text("SafeArea"),           // *const  for *Immutable object.
                                    titleTextStyle: const TextStyle(
                                          fontSize: 35.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          letterSpacing: 4.0,

                                          color: Colors.white,
                                    ),

                                    toolbarHeight: 100,
                                    toolbarOpacity: .9,
                              ),*/

                              // -------------------------
                              body: SafeArea(        // *Target Widget       <--- ***
                                          top: false ,
                                          right: true ,
                                          bottom: true,
                                          left: true,

                                          child: Container(
                                                width: 300.0,
                                                height: 150.0,

                                                color: const Color.fromARGB(255, 43, 45, 88),     // *const  for *Immutable object.

                                                child: const Center(    // *const  for *Immutable object.
                                                      child: Text(
                                                          "BODY",
                                                            style: TextStyle(
                                                                  fontSize: 30.0,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontStyle: FontStyle.normal,
                                                                  letterSpacing: 4.0,
                                                                  color: Colors.white,
                                                            ),
                                                      ),
                                                ),
                                          ),
                                    ),
                        ),
                  );
      }
}



