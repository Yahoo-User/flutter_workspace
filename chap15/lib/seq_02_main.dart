import 'package:flutter/material.dart';

import './util/logger.dart';

// import './screen/seq_01_home_screen.dart';
// import './screen/seq_04_home_screen.dart';
// import './screen/seq_05_home_screen.dart';
// import './screen/seq_06_home_screen.dart';
// import './screen/seq_08_home_screen.dart';
// import './screen/seq_11_home_screen.dart';
// import './screen/seq_14_home_screen.dart';
// import './screen/seq_15_home_screen.dart';
import './screen/seq_18_home_screen.dart';


void main(List<String> args) {
    console('main($args, ${args.length}) invoked.');

    // void runApp(Widget app)
    runApp(const MaterialApp(   // MaterialApp extends StatefulWidget
        home: HomeScreen(),         //  final Widget? home
    ));
}


