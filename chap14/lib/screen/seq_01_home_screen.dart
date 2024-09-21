import 'package:flutter/material.dart';
import '../util/logger.dart';


class HomeScreen extends StatelessWidget {

    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        return const Scaffold(
            body: Text("HomeScreen", style: TextStyle(color: Colors.white, fontSize: 30.0, fontFamily: 'D2Coding', fontStyle: FontStyle.italic)),
        );
    } // build

} // end class

