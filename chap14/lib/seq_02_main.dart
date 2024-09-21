import 'package:flutter/material.dart';
import '../util/logger.dart';

// import './screen/seq_01_home_screen.dart';
// import './screen/seq_02_home_screen.dart';
// import './screen/seq_03_home_screen.dart';
// import './screen/seq_04_home_screen.dart';
// import './screen/seq_05_home_screen.dart';
// import './screen/seq_06_home_screen.dart';
import './screen/seq_07_home_screen.dart';


void main(List<String> args) {
    console('main($args, ${args.length}) invoked.');

    runApp(MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        home: const HomeScreen(),
    ));
} // main


