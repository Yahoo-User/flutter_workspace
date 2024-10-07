import 'package:flutter/material.dart';
import './util/logger.dart' show console;

import './screen/seq_02_homes_screen.dart';


void main(List<String> args) {
    console('main($args) invoked.');

    runApp(const MaterialApp(
        home: HomeScreen(),
    ));
}


