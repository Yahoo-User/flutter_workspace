import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../util/logger.dart';


class HomeWidget extends StatelessWidget {

      // --------------------------------
      // *Important: const constructors can't have a body. (***)
      // *Important: the constructor being called isn't a `const` constructor. (***)
      // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
      // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
      // --------------------------------

      // const HomeWidget({Key? key}): super(key: key);    // 1
      const HomeWidget({super.key});                              // 2


      @override
      Widget build(BuildContext context) {
            console('build($context) invoked.');

            // -----------------------
            // Specifies the style to use for the system overlays that are visible (if any)
            // (e.g. the status bar on Android or iOS, the system navigation bar on Android)
            // -----------------------
            SystemChrome.setSystemUIOverlayStyle(
                  // Specifies a preference for the style of the system overlays.
                  // Used (1) by AppBar.systemOverlayStyle for declaratively setting the style of the system overlays,
                  // and (2) by SystemChrome.setSystemUIOverlayStyle for imperatively setting the style of the system overlays.
                  SystemUiOverlayStyle.light
            );

            // -----------------------
            SystemChrome.setEnabledSystemUIMode(
                  // SystemUiMode.edgeToEdge
                  // SystemUiMode.immersive
                  // SystemUiMode.immersiveSticky
                  // SystemUiMode.leanBack
                  SystemUiMode.manual
            );

            // -----------------------
            SystemChrome.setPreferredOrientations([
                  // DeviceOrientation.portraitUp
                  DeviceOrientation.portraitDown
                  // DeviceOrientation.landscapeLeft
                  // DeviceOrientation.landscapeRight
            ]);

            // -----------------------
            Timer.periodic(
                  const Duration(seconds: 3),
                  (timer) => console('Run: $timer')
            );


            return Scaffold(
                  backgroundColor: Colors.white,

                  /**
                  appBar: AppBar(
                        // Specifies a preference for the style of the system overlays.
                        // Used    (1) by AppBar.systemOverlayStyle for declaratively setting the style of the system overlays,
                        // and      (2) by SystemChrome.setSystemUIOverlayStyle for imperatively setting the style of the system overlays.
                        systemOverlayStyle: SystemUiOverlayStyle.light ,

                        backgroundColor: Colors.amber,
                        toolbarHeight: 100.0,

                        centerTitle: true,
                        title: const Text('PageView'),
                        titleTextStyle: const TextStyle(
                              color: Colors.black,
                              letterSpacing: 5.0,

                              fontFamily: 'D2Coding',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                        ),

                        actions: <Widget>[
                              IconButton(onPressed: () => console('Arrow Back Pressed.'), icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.green,
                                    size: 30.0,
                              )),

                              IconButton(
                                  onPressed: () => console('Home Pressed.'),
                                  icon: const Icon(
                                        Icons.home_max_sharp,
                                        color: Colors.white,
                                        size: 30.0,
                                  )),

                              IconButton(onPressed: () => console('Arrow Forward Pressed'), icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.red,
                                    size: 30.0,
                              )),
                        ],
                  ),
                  */

                  body: PageView(
                        children: <int>[ 1, 2, 3, 4, 5]
                              .map((number) =>
                                    Image.asset(
                                          'asset/img/image_$number.jpeg',
                                          // fit: BoxFit.contain,           // XX, left-right margin.
                                          // fit: BoxFit.cover,               // OK, Full Screen, but keeping image ratio.
                                          // fit: BoxFit.fill,                   // OK, Full Screen. but keeping image ratio.
                                          // fit: BoxFit.fitHeight,         // XX, Full Height. but left-right margin.
                                          fit: BoxFit.fitWidth,          // OK, Full Screen. but keeping image ratio.
                                          // fit: BoxFit.none,                // OK, Full Screen, but Image ratio ignored.
                                    ))
                              .toList(growable: false),
                  ),
            );
      } // build

} // end class


