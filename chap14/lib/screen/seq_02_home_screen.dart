import 'package:flutter/material.dart';
import '../util/logger.dart';


class HomeScreen extends StatelessWidget {

    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        return Scaffold(
            appBar: renderAppBar(),

            body: const Text("HomeScreen",
                    style: TextStyle(
                        color: Colors.white,

                        fontSize: 30.0,
                        fontFamily: 'D2Coding',
                        fontStyle: FontStyle.italic
                    )
            ),
        );
    } // build

    AppBar renderAppBar() {
        console('renderAppBar() invoked.');

        return AppBar(
            backgroundColor: Colors.deepPurple,
            toolbarHeight: 80.0,

            centerTitle: true,
            title: const Text(
                "Check Presence",

                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.0,

                    fontFamily: 'Economica',
                    fontSize: 38.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                )
            ),
        );
    } // renderAppBar

} // end class

