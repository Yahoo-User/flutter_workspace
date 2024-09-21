import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../util/logger.dart';

import './homewidgetstate.dart';


class HomeWidget extends StatefulWidget { // With State Management

      // --------------------------------
      // *Important: const constructors can't have a body. (***)
      // *Important: the constructor being called isn't a `const` constructor. (***)
      // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
      // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
      // *Important: A constant constructor can't call a non-constant super constructor.  (***)
      // --------------------------------

      // const HomeWidget({Key? key}): super(key: key);     // 1
      // const HomeWidget({super.key});                     // 2
      HomeWidget({super.key}) {                          // 3
            console('1. HomeWidget::Constructor($key) invoked.');
      } // Constructor


      @override
      // Important: Don't put any logic in 'createState'.
      State<HomeWidget> createState() => HomeWidgetState();

} // end class





