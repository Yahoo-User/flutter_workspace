import 'package:flutter/material.dart';
import 'package:chap10/util/logger.dart';

import './dday.dart';
import './coupleimage.dart';


class HomeWidget extends StatelessWidget {

      // --------------------------------
      // *Important: const constructors can't have a body. (***)
      // *Important: the constructor being called isn't a `const` constructor. (***)
      // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
      // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
      // --------------------------------

      // const HomeWidget({Key? key}): super(key: key);     // 1
      const HomeWidget({super.key});                     // 2


      @override
      Widget build(BuildContext context) {
            console('build($context) invoked.');

            return Scaffold(
                  backgroundColor: Colors.pink[100],

                  /**
                  appBar: AppBar(
                        backgroundColor: Colors.amber,
                        toolbarHeight: 100.0,

                        centerTitle: true,
                        title: const Text("D-Day App"),
                        titleTextStyle: const TextStyle(
                              color: Colors.black,
                              letterSpacing: 5.0,

                              fontFamily: 'D2Coding',
                              fontSize: 30.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                        ),

                        actions: <Widget>[
                              IconButton(
                                    onPressed: () => console('IconButton::onPressed() invoked.'),
                                    icon: const Icon(
                                          Icons.home_work_outlined,
                                    ),
                                    iconSize: 30.0,
                                    color: Colors.black,
                              ),
                        ],
                  ),
                  */

                  body: SafeArea(   // Prepare for Screen Notch.
                        top: true,
                        bottom: false,

                        child: Column(
                              // Most-top & Most-bottom Alignment.
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // Stretch Cross Axis To The Maximum For Screen.
                              crossAxisAlignment: CrossAxisAlignment.stretch,

                              children: <Widget>[
                                    DDay(
                                          onHeartPressed: onHeartPressed,
                                          firstDay: DateTime.now(),
                                    ),
                                    CoupleImage(),
                              ],
                        ),
                  ),
            );
      } // build

      // Event handler when the heart clicked by mouse.
      void onHeartPressed() {
            console('HomeWidget::onHeartPressed() invoked.');
      } // onHeartPressed

} // end class



