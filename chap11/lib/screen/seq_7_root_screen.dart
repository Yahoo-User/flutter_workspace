import 'package:flutter/material.dart';
import '../util/logger.dart';

import '../const/seq_1_colors.dart';


class RootScreen extends StatefulWidget {  // With state management.

  const RootScreen({super.key});


  @override
  State<RootScreen> createState() => _RootScreenState();

} // end class



class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  // TabController? controller;       // 1
  late TabController controller;   // 2


  // A constant constructor can't call a non-constant super constructor
  // const              // XX
  _RootScreenState() {
    console('Default Constructor Invoked.');
  } // Default Constructor

  @override
  void initState() {
    console('1. initState() invoked.');

    // Implementations of this method should start with a call to the inherited method,
    // as in `super.initState()`.
    super.initState();

    // State Field Initialization
    // required int length : The total number of tabs.
    // required TickerProvider vsync :
    //    Creates an object that manages the state required by TabBar and a TabBarView.
    controller = TabController(length: 2, vsync: this, );
  } // initState

  @override
  Widget build(BuildContext context) {
    console('2. build($context) invoked.');

    return Scaffold(
      backgroundColor: backgroundColor,

      // TabBarView: Creates a page view with one child per tab.
      body: TabBarView(
        controller: controller,
        children: renderChildren(),
      ),

      // A bottom navigation bar to display at the bottom of the scaffold.
      bottomNavigationBar: renderBottomNavigation(),
    );
  } // build

} // end class


List<Widget> renderChildren() {
  console('renderChildren() invoked.');
  return <Widget>[
    Container(
      color: backgroundColor,

      child: const Center(
        child: Text(
          'Tab 1',

          style: TextStyle(
            color: Colors.white,

            fontFamily: 'D2Coding',
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    ),

    Container(
      color: backgroundColor,

      child: const Center(
        child: Text(
          'Tab 2',
          style: TextStyle(
            color: Colors.white,

            fontFamily: 'D2Coding',
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    ),
  ];
} // renderChildren


BottomNavigationBar renderBottomNavigation() {
  console('renderBottomNavigation() invoked.');

  // *Important: use 'const' literals as arguments to constructors of '@immutable' classes.
  return BottomNavigationBar(
    backgroundColor: backgroundColor,
    selectedItemColor: primaryColor,
    unselectedItemColor: secondaryColor,

    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.edgesensor_high_outlined,
          color: Colors.blue,
          size: 25.0,
        ),
        label: 'Dice',
      ),

      BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
          color: Colors.blue,
          size: 30.0,
        ),
        label: 'Settings',
      ),
    ],
  );
} // renderBottomNavigation


