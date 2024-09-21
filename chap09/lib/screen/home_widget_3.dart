import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../util/logger.dart';


class HomeWidget extends StatefulWidget {

      // --------------------------------
      // *Important: const constructors can't have a body. (***)
      // *Important: the constructor being called isn't a `const` constructor. (***)
      // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
      // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
      // --------------------------------

      // const HomeWidget({Key? key}): super(key: key);    // 1
      const HomeWidget({super.key});                              // 2


      // @override
      // State<HomeWidget> createState() {     // 1st. method
      //       return HomeState();
      // } // createState

      @override
      State<HomeWidget> createState() => HomeState();   // 2nd. method

} // end class



class HomeState extends State<HomeWidget> {
        final PageController pageController = PageController();


        @override
        void initState() {
              super.initState();

              Timer.periodic(
                    const Duration(seconds: 3),

                    // (timer) => console('Run: $timer'),       // seq_1

                    (timer) {     // seq_2
                          console('time callback() invoked.');

                          int? nextPage = pageController.page?.toInt();
                          console('\t+ currentPage: $nextPage');

                          if(nextPage == null) return;

                          if(nextPage == 4) {
                                nextPage = 0;
                          } else {
                                nextPage++;
                          } // if-else

                          console('\t+ nextPage: $nextPage');

                          pageController.animateToPage(
                                nextPage,
                                duration: const Duration(microseconds: 500),

                                // curve: Curves.ease,
                                // curve: Curves.easeIn,
                                // curve: Curves.easeInBack,
                                // curve: Curves.easeInCirc,
                                // curve: Curves.easeInCubic,
                                // curve: Curves.easeInExpo,
                                // curve: Curves.bounceIn,
                                // curve: Curves.bounceOut,
                                // curve: Curves.bounceInOut,
                                curve: Curves.decelerate,
                                // curve: Curves.linear,
                          );
                    } // callback
              );
        } // initState

        @override
        Widget build(BuildContext context) {
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

              return Scaffold(
                    backgroundColor: Colors.white,

                    body: PageView(
                          controller: pageController,
                          children: <int>[ 1, 2, 3, 4, 5 ]
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




