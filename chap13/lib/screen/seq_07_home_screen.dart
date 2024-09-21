import 'package:flutter/material.dart';
import '../shared/seq_01_library.dart';


class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});


    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        return const Scaffold(
            body: Text('Home Screen'),
        );
    } // build

} // end class


