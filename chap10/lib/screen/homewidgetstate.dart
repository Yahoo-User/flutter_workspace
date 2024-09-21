
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/logger.dart';

import 'package:chap10/screen/homewidget_2.dart';
import 'package:chap10/screen/coupleimage.dart';
import 'package:chap10/screen/dday.dart';


class HomeWidgetState extends State<HomeWidget> {   // The state of HomeWidget Widget
    /* State Fields */

    // DateTime firstDay = DateTime.now();             // 1st. method

    /*
     * In Dart language, the `late` keyword is used to indicate "late initialization" of variables.
     * When declaring a variable with the `late` keyword,
     * it explicitly signifies that the variable cannot be accessed until it is initialized.
     * This ensures that the variable must be initialized before it is used,
     * while allowing the initialization to be deferred until necessary.
     * Typically, Dart requires variables to be initialized at the point of declaration,
     * but using `late` allows postponing initialization until just before the variable is accessed.
     * This is particularly useful when you want to delay field initialization in constructors.
     */
    late DateTime firstDay;                         // 2nd. method : initialization at the initiate()

    // --------------------------------
    // *Important: const constructors can't have a body. (***)
    // *Important: the constructor being called isn't a `const` constructor. (***)
    // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
    // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
    // *Important: A constant constructor can't call a non-constant super constructor.  (***)
    // --------------------------------
    // HomeWidgetState();      // 1
    HomeWidgetState() {     // 2
        console('2. HomeWidgetState::Constructor() invoked.');
    } // Constructor


    @override
    // warning: This method overrides a method annotated as '@mustCallSuper' in 'State'.
    void initState() {
        console('3. HomeWidgetState::initState() invoked.');
        super.initState();  // *Required*

        firstDay = DateTime.now();
        console('\t+ this.firstDay: $firstDay');
    } // initState

    @override
    // warning: This method overrides a method annotated as '@mustCallSuper' in 'State'.
    void didUpdateWidget(HomeWidget oldWidget) {
        console('HomeWidgetState::didUpdateWidget($oldWidget) invoked.');
        super.didUpdateWidget(oldWidget);   // *Required*

    } // didUpdateWidget

    @override
    // warning: This method overrides a method annotated as '@mustCallSuper' in 'State'.
    void setState(VoidCallback fn) {    // typedef VoidCallback = void Function();
        console('HomeWidgetState::setState($fn) invoked.');
        super.setState(fn); // *Required*

    } // setState

    @override
    // warning: This method overrides a method annotated as '@mustCallSuper' in 'State'.
    void deactivate() {
        console('HomeWidgetState::deactivate() invoked.');
        super.deactivate(); // *Required*

    } // deactivate

    @override
    // warning: This method overrides a method annotated as '@mustCallSuper' in 'State'.
    void dispose() {
        console('HomeWidgetState::dispose() invoked.');
        super.dispose();    // *Required*

    } // dispose

    @override
    // BuildContext: A handle to the location of a widget in the widget tree.
    Widget build(BuildContext context) {
        console('4. HomeWidgetState::build($context) invoked.');

        return Scaffold(
            backgroundColor: Colors.pink[100],

            body: SafeArea(
               top: true,
               bottom: false,

               child: Column(
                   // Most-top & Most-bottom Alignment.
                   mainAxisAlignment: MainAxisAlignment.center,

                   // Stretch Cross Axis To The Maximum For Screen.
                   crossAxisAlignment: CrossAxisAlignment.stretch,

                   children: <Widget>[
                       DDay(
                           // {required void Function() onHeartPressed}
                           onHeartPressed: onHeartPressed,
                           firstDay: firstDay,
                       ),
                       CoupleImage(),
                   ],
               ),
            ),
        );
    } // build

    void onHeartPressed() {
        console('HomeWidgetState::onHeartPressed() invoked.');

        // --------------------------------
        // 1st. try: change `firstDay` state field manually.
        // --------------------------------
        /*
        setState(() {
            // DateTime subtract(Duration duration)
            firstDay = firstDay.subtract(const Duration(days: 1));  // firstDay - 1
        });
        */

        // --------------------------------
        // 2nd. try : use Cupertino (iOS) style Date Picker Dialog.
        // --------------------------------
        /*
        showCupertinoDialog(
            // required BuildContext context
            context: context,

            // 1. required WidgetBuilder builder
            // 2. typedef WidgetBuilder = Widget Function(BuildContext context);
            builder: (BuildContext context) {
                return CupertinoDatePicker(
                    // Mode that shows the date in month, day of month, and year.
                    mode: CupertinoDatePickerMode.date,

                    // 1. required this.onDateTimeChanged
                    // 2. final ValueChanged<DateTime> onDateTimeChanged;
                    // 3. typedef ValueChanged<T> = void Function(T value);
                    onDateTimeChanged: (DateTime date) {
                        console('showCupertinoDialog::builder::onDateTimeChanged($date) invoked.');

                    },  // onDateTimeChanged
                );  // CupertinoDatePicker
            },  // builder
        );  // showCupertinoDialog
        */

        // --------------------------------
        // 3rd. method : use Cupertino (iOS) style Date Picker Dialog
        //               at the specified position of screen.
        // --------------------------------
        showCupertinoDialog(
            // required BuildContext context
            context: context,   // Invoke Getter

            // 1. required WidgetBuilder builder
            // 2. typedef WidgetBuilder = Widget Function(BuildContext context);
            builder: (BuildContext context) {
                return Align(
                    alignment: Alignment.bottomCenter,  // static const

                    child: Container(
                        color: Colors.white,
                        height: 300.0,

                        child: CupertinoDatePicker(
                            // Mode that shows the date in month, day of month, and year.
                            mode: CupertinoDatePickerMode.date,

                            // maximumDate: DateTime.now(),

                            // 1. required this.onDateTimeChanged
                            // 2. final ValueChanged<DateTime> onDateTimeChanged;
                            // 3. typedef ValueChanged<T> = void Function(T value);
                            onDateTimeChanged: (DateTime date) {
                                console('CupertinoDatePicker::onDateTimeChanged($date) invoked.');

                                setState(() {
                                    firstDay = date;
                                    console('CupertinoDatePicker::onDateTimeChanged > setState: firstDay changed.');
                                }); // setState
                            },  // onDateTimeChanged
                        ),
                    ),
                );
            },  // builder

            barrierDismissible: true,
        );  // showCupertinoDialog
    } // onHeartPressed

} // end class


