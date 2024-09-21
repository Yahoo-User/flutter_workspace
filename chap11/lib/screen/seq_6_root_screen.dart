import 'package:flutter/material.dart';
import '../util/logger.dart';


class RootScreen extends StatefulWidget {  // With state management.

  // --------------------------------
  // *Important: const constructors can't have a body. (***)
  // *Important: the constructor being called isn't a `const` constructor. (***)
  // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
  // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
  // --------------------------------

  const RootScreen({super.key});


  // @override
  // State<StatefulWidget> createState() {   // 1
  //   return _RootScreenState();
  // } // build

  @override
  State<RootScreen> createState() => _RootScreenState();  // 2

} // end class


class _RootScreenState extends State<RootScreen> {

  // A constant constructor can't call a non-constant super constructor
  // const              // XX
  _RootScreenState() {
    console('Default Constructor Invoked.');
  } // Default Constructor


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


