
import 'package:flutter/material.dart';
import '../util/logger.dart';


class HomeScreen extends StatelessWidget {

    // const HomeScreen({Key? key}): super(key: key);  // 1
    // const HomeScreen({super.key});                            // 2

    // const            // XX : Const constructors can't have a body.
    HomeScreen({super.key}) {                                    // 3
        console('Default Constructor($key) Invoked.');

    } // Default Constructor

    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        // Scaffold: creates a visual scaffold for Material Design widgets.
        return const Scaffold(
            backgroundColor: Color(0x00ffffff),

            body: Center(
                child: Text(
                    'Home Screen',

                    style: TextStyle(
                        color: Colors.yellowAccent,

                        fontFamily: 'D2Coding',
                        fontSize: 43.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                    ),
                ),
            ),
        );
    } // build

} // end class

