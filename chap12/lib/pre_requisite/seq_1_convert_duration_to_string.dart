import 'package:chap12/util/logger.dart';
import 'dart:core';


// Execute this in the command-line interface.  <--- ***

void main() {
    console('main() invoked.');

    Duration duration = const Duration(seconds: 192);
    console('duration: $duration');

    // ---------------------
    // Converting Duration into String with `hh:mm:ss` format

    /**
     * 1st. trying
     */

    List<String> tokens = duration.toString().split('.');

    tokens.forEach(console);                             // 1

    void closure1(String token) {                         // 2
        console('closure1($token) invoked.');
    } // closure1

    tokens.forEach(closure1);

    // function prototype:
    //      Null closure(String token)
    // *Important: without return type means that this function returns null, So return type is `Null`.
    closure2(String token) {                                // 3
        console('closure2($token) invoked.');
    } // closure2

    tokens.forEach(closure2);

    // function prototype:
    //      void closure3(dynamic token)
    closure3(token) => console('closure3($token) invoked.');              // 4

    tokens.forEach(closure3);


    // ---------------------

    /**
     * 2nd. trying
     */

    // Print out 1st. item in the List<String>.
    console(duration.toString().split('.')[0]);
    console(duration.toString().split('.').elementAt(0));
    console(duration.toString().split('.').first);  // Using first getter


    // ---------------------
    // Without hours, just minutes & seconds.

    console(duration.toString().split('.')[0].split(':').sublist(1).join(':'));         // 1
    console(duration.toString().split('.')[0].split(':').sublist(1, 3).join(':'));     // 2, sublist(start, [int? end]) : Half-open.


    // ---------------------

    console(duration.inHours);         // int get inHours
    console(duration.inMinutes);     // int get inMinutes
    console(duration.inSeconds);    // int get inSeconds

    // String padLeft(int width, [String padding = ' '])
    console(duration.inMinutes.toString().padLeft(2, '0'));
    console((duration.inSeconds % 60).toString().padLeft(2, '0'));


    // ---------------------

    console('192'.padLeft(5, '0'));
    console('192'.padRight(5, '0'));

} // main

