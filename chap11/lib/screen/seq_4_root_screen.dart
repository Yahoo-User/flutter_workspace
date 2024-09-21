import 'package:flutter/material.dart';
import '../util/logger.dart';


class RootScreen extends StatelessWidget {  // With no state management.

  // --------------------------------
  // *Important: const constructors can't have a body. (***)
  // *Important: the constructor being called isn't a `const` constructor. (***)
  // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
  // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
  // --------------------------------

  // const RootScreen({super.key});                   // 1
  // const RootScreen({Key? key}) : super(Key: key);  // 2

  RootScreen({super.key}) {        // 3
    console('RootScreen($key) invoked.');
  } // Constructor


  @override
  Widget build(BuildContext context) {
    console('build($context) invoked.');

    return Scaffold(
      // TabBarView: Creates a page view with one child per tab.
      body: TabBarView(children: renderChildren()),
      // A bottom navigation bar to display at the bottom of the scaffold.
      bottomNavigationBar: renderBottomNavigation(),
    );
  } // build

} // end class


List<Widget> renderChildren() {
  console('renderChildren() invoked.');
  return <Widget>[];
} // renderChildren


BottomNavigationBar renderBottomNavigation() {
  console('renderBottomNavigation() invoked.');

  // *Important: use 'const' literals as arguments to constructors of '@immutable' classes.
  return BottomNavigationBar(items: const <BottomNavigationBarItem>[]);
} // renderBottomNavigation


