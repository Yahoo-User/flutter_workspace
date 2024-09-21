import 'package:flutter/material.dart';
import '../util/logger.dart';


class HomeScreen extends StatelessWidget {  // With no state management.

    // --------------------------------
    // *Important: const constructors can't have a body. (***)
    // *Important: the constructor being called isn't a `const` constructor. (***)
    // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
    // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
    // --------------------------------

    // const HomeScreen({Key? key}): super(key: key);    // 1

    HomeScreen({super.key}) {                   // 2
        console('HomeScreen($key) invoked.');
    } // Constructor


    @override
    Widget build(BuildContext context) {    // Only once executed to render all widgets.
        console('build($context) invoked.');

        return Scaffold(
            backgroundColor: Colors.white,

            appBar: AppBar(
                backgroundColor: Colors.amber,
                toolbarHeight: 100.0,

                centerTitle: true,
                title: const Text("Random Dice"),
                titleTextStyle: const TextStyle(
                    color: Colors.black,

                    fontFamily: 'D2Coding',
                    fontSize: 30.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                ),

                actions: <Widget>[
                    IconButton(
                        onPressed: () {
                            console('IconButton::onPressed() invoked.');
                        },

                        icon: const Icon(
                            Icons.home_max_outlined,
                            size: 35.0,
                            color: Colors.white,
                        ),
                    ),
                ],
            ),

            body: const Center(
                child: Text('Home Screen'),
            ),
        );
    } // build

} // end class

