import 'package:flutter/material.dart';
import './shared/seq_01_library.dart';

// import './screen/seq_07_home_screen.dart';
import './screen/seq_09_home_screen.dart';


void main(List<String> args) {
    console('main($args, ${args.length}) invoked.');

    runApp(MaterialApp(
        theme: ThemeData.dark(),
        home: const HomeScreen(),
    ));
} // main


