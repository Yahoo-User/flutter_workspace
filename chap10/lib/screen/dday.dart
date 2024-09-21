import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../util/logger.dart';


class DDay extends StatelessWidget {     // Without state management.
    // typedef GestureTapCallback = void Function();
    final GestureTapCallback onHeartPressed;
    final DateTime firstDay;


    // --------------------------------
    // *Important: const constructors can't have a body. (***)
    // *Important: the constructor being called isn't a `const` constructor. (***)
    // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
    // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
    // --------------------------------
    // const DDay({Key? key}): super(key: key);   // 1
    // const DDay({super.key});                   // 2

    // onHeartPressed : Input callback declared in the `HomeWidgetState`.
    DDay({
        super.key,
        required this.onHeartPressed,
        required this.firstDay,
    }) {                         // 3
        console('DDay::Constructor($key, $onHeartPressed, $firstDay) invoked.');
    } // Constructor


  @override
  Widget build(BuildContext context) {      // Render only once.    (***)
    console('DDay::build($context) invoked.');

    // Not necessary.
    // final textTheme = Theme.of(context).textTheme;
    // console('\t+ textTheme: $textTheme');

    // To get the interval between first day and now.
    final now = DateTime.now();
    int days = now.difference(firstDay).inDays + 1;
    String ddays = (days >= 0) ? "D+$days" : "D-$days";
    console('\t+ ddays: $ddays');

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: <Widget>[ // List
        const SizedBox(height: 16.0,),
        const Text(
          'U & I',
        ),

        const SizedBox(height: 16.0,),
        const Text(
          'The First Day We Met.',
        ),
        Text(
          // '2024.04.07',
          intl.DateFormat("yyyy-MM-dd").format(firstDay),    // 1
          // '${firstDay.year}-${firstDay.month}-${firstDay.day}', // 2
        ),

        const SizedBox(height: 16.0,),
        IconButton(
            iconSize: 60.0,

            // final GestureTapCallback onHeartPressed;
            // typedef GestureTapCallback = void Function();
            onPressed: onHeartPressed,                                      // 2
            // onPressed: () => console('IconButton::onPressed() invoked.'),  // 1

            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            )),

        const SizedBox(height: 16.0,),
        Text(
            // 'D + 365',

            // 'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',  // 1
            // 'D+${now.difference(firstDay).inDays + 1}',  // 2
            ddays,
        )
      ],
    );
  } // build

} // end class

