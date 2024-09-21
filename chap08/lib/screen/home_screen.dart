// import 'package:chap08/util/logger.dart';
// import '../util/logger.dart';

import 'package:flutter/material.dart';


// *Important: the file name must be a lower_case_with_underscores identifier.

class HomeScreen extends StatelessWidget {

    // --------------------------------
    // *Important: const constructors can't have a body. (***)
    // *Important: the constructor being called isn't a `const` constructor. (***)
    // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
    // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
    // --------------------------------

    // const HomeScreen({Key? key}): super(key: key);    // 1
    const HomeScreen({super.key});                               // 2


    @override
    Widget build(BuildContext context) {    // Only once executed, because of no state management.
        return Scaffold(
            backgroundColor: Colors.white,

            appBar: AppBar(
                backgroundColor: Colors.amber,
                toolbarHeight: 100.0,

                centerTitle: true,
                title: const Text("Blog WebApp"),

                titleTextStyle: const TextStyle(
                    color: Colors.black,
                    letterSpacing: 5.0,

                    fontFamily: 'D2Coding',
                    fontSize: 30.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                ) ,
            ) ,

            body: const Center(
                    child: Text(
                        "Home Screen",

                        style: TextStyle(
                            color: Colors.red,
                            letterSpacing: 2.0,

                            fontSize: 28.0,
                            fontFamily: 'D2Coding',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                        ),
                )
            ),
        );
    } // build

} // end class

