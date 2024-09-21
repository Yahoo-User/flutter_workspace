import 'package:flutter/material.dart';

// import 'screen/seq_4_root_screen.dart';
// import 'screen/seq_6_root_screen.dart';
// import 'screen/seq_7_root_screen.dart';
// import 'screen/seq_8_root_screen.dart';
// import 'screen/seq_10_root_screen.dart';
import 'screen/seq_12_root_screen.dart';



/*
void main(List<String> args) {        // 1
  runApp(MaterialApp(
    home: RootScreen(),
  ));
} // main
 */

/*
void main(List<String> args) => {     // 2
  runApp(MaterialApp(home: RootScreen(),))
};
 */

void main(List<String> args) => runApp(const MaterialApp(home: RootScreen(), ));  // 3

