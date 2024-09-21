/*
 * Common Logger Printing Out Current Thread Name With Log Message.
 *    - Required Dart Packages:  (1) dart:isolate  (2) dart:io
 *
 *    - Required Other Packages:   (1) intl (package:intl/intl.dart) for DateFormat Class
 *                                                      (2) path (package:path/path.dart) for basename() function
 */

import 'dart:developer' as developer;
import 'dart:io';
import 'dart:isolate';

import 'package:intl/intl.dart' as intl;
import 'package:path/path.dart' as path;


void console(final Object? message) {
      // print('${getCurrentDateTime()} : [${getCurrentIsolateName()}] ${getCurrentDartFileName()} - $message');  // 1, OK
      developer.log('${getCurrentDateTime()} : [${getCurrentIsolateName()}] ${getCurrentDartFileName()} - $message');  // 1, OK
} // console

String? getCurrentIsolateName() {
      return Isolate.current.debugName;
} // getCurrentIsolateName

String getCurrentDateTime() {
      // return intl.DateFormat("yyyy/MM/dd HH:mm:ss.SSS").format(DateTime.now());     // 1, OK
      return intl.DateFormat("HH:mm:ss.SSS").format(DateTime.now());     // 2, OK
} // getCurrentDateTime

String getCurrentDartFileName() {
      Uri scriptUri = Platform.script;
      return path.basename(scriptUri.toFilePath());
} // getCurrentDartFileName

