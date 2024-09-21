/*
  * =================================
  *   The `Stack` Widget.
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

        // const                    // XX, (4)
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
                                      backgroundColor: Colors.white60,

                                      // -------------------------
                                      appBar: AppBar(
                                              backgroundColor: Colors.amber,

                                              centerTitle: true,

                                              title: const Text("Stack"),             // *const  for *Immutable object.
                                              titleTextStyle: const TextStyle(      // *const  for *Immutable object.
                                                      fontSize: 35.0,
                                                      fontWeight: FontWeight.bold,
                                                      fontStyle: FontStyle.normal,
                                                      letterSpacing: 5.0,

                                                      color: Colors.black,
                                              ),

                                              toolbarHeight: 120.0,
                                              toolbarOpacity: 1.0,
                                      ),

                                      // -------------------------
                                      body: Center(
                                              child: Stack(     // **Target Widget
                                                      fit: StackFit.loose,                   // Default
                                                      // fit: StackFit.expand,
                                                      // fit: StackFit.passthrough,

                                                      children: [
                                                              Container(
                                                                      width: 300.0,
                                                                      height: 300.0,

                                                                      color: Colors.red,
                                                              ),

                                                              Container(
                                                                      width: 250.0,
                                                                      height: 250.0,

                                                                      color: Colors.green,
                                                              ),

                                                              Container(
                                                                      width: 200.0,
                                                                      height: 200.0,

                                                                      color: Colors.blue,

                                                                      child: IconButton(
                                                                              onPressed: () {
                                                                                      console("Pressed ...");
                                                                                      console('$this, $runtimeType');
                                                                              },

                                                                              icon: const Icon(         // *const  for *Immutable object.
                                                                                  Icons.home_max_rounded
                                                                              ),
                                                                              iconSize: 50.0,

                                                                              color: Colors.yellowAccent,
                                                                              hoverColor: Colors.red,
                                                                      ),
                                                              ),
                                                      ],
                                              ),
                                      ),
                              ),
                      );
        }
}