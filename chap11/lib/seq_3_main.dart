import 'package:flutter/material.dart';
import './util/logger.dart';

import './const/seq_1_colors.dart';

import './screen/seq_2_homescreen_1.dart';

// to test of HomeScreen Widget declared in the seq_9_homescreen_2.dart
// import './screen/seq_9_homescreen_2.dart';


void main(List<String> args) {
  console('main($args, ${args.length}) invoked.');

  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: backgroundColor,

      sliderTheme: SliderThemeData(
        thumbColor: primaryColor,
        activeTrackColor: primaryColor,
        inactiveTrackColor: primaryColor.withOpacity(.3),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        unselectedItemColor: secondaryColor,
        backgroundColor: backgroundColor,
      )
    ),

    home: HomeScreen(),

    // to test of HomeScreen Widget declared in the seq_9_homescreen_2.dart
    // home: const HomeScreen(diceNumber: 1),
  ));

  return;
} // main



