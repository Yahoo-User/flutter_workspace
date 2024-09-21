import 'package:flutter/material.dart';
import './util/logger.dart';

// import './screen/homewidget.dart';
import './screen/homewidget_2.dart';


void main(List<String> args) {
      console('main($args, ${args.length}) invoked.');

      runApp(
             MaterialApp(
                  theme: ThemeData(
                        fontFamily: 'D2Coding',

                        textTheme: const TextTheme(
                              headlineLarge: TextStyle(
                                    color: Colors.white,
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'D2Coding',
                              ),

                              headlineMedium: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.w700,
                              ),

                              bodyMedium: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                              ),

                              bodySmall: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                              )
                        ),
                  ),

                  home: HomeWidget(),
            ),
      ); // runApp

      return;
} // main


