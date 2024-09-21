import 'package:flutter/material.dart';

import '../const/seq_1_colors.dart';
import '../util/logger.dart';


class RootScreen extends StatefulWidget {  // With state management.
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
} // end class



class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  // TabController? controller;       // 1
  late TabController controller;   // 2


  // A constant constructor can't call a non-constant super constructor.
  // const              // XX
  _RootScreenState() {
    console('Default Constructor Invoked.');
  } // Default Constructor

  @override
  void initState() {    // Only once called back when this RootScreen widget registered to the widegt tree.
    console('1. initState() invoked.');

    // Implementations of this method should start with a call to the inherited method, as in `super.initState()`.
    super.initState();

    // (1) required int length : The total number of tabs.
    // (2) required TickerProvider vsync : creates an object that manages the state required by TabBar and a TabBarView.
    controller = TabController(length: 2, vsync: this,);

    // Add a closed to be called back when tab bar view changed when RootScreen widget added to the widget tree.
    // controller.addListener: Register a closure to be called when the tab view changed.
    // controller!.addListener(tabListener);  // XX : The '!' will have no effect because the receiver can't be null.
    controller.addListener(tabListener);
  } // initState

  void tabListener() {  // Change state
    console('tabListener(}) invoked: controller.index: ${controller.index}');

    // Set dirty state -> cause build() method to re-render and set clean state.
    setState(() => console('\t+ setState callback invoked.'));
  } // tabListener

  @override
  void dispose() {
      console('dispose() invoked.');

      // The TabController Listener must be remove whenever this RootScreen widget disposed from the widget tree.
      // controller!.removeListener(tabListener);    // XX, The '!' will have no effect because the receiver can't be null.
      controller.removeListener(tabListener);

      console('\t+ tabListener removed from tabController');

      super.dispose();
  } // dispose

  @override
  Widget build(BuildContext context) {
    console('2. build($context) invoked.');
    console('\t+ controller.index: ${controller.index}');

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
      // Set Theme.
      backgroundColor: backgroundColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: secondaryColor,

      // currentIndex: the index into items for the current active
      // currentIndex: controller!.index,    // XX, The '!' will have no effect because the receiver can't be null.
      currentIndex: controller.index,

      // onTap: called when one of the items is tapped ( void Function(int)? onTap ).
      onTap: (tabIndex) {  // Tab index starts with 0.
        console('BottomNavigationBar::onTap($tabIndex) invoked.');
        console('\t+ controller.index: ${controller.index}');

        // Immediately sets index and previousIndex
        // and then plays the animation from its current value to index.
        if(controller.index != tabIndex) {
          setState(() {
            console('\t+ setState callback invoked.');
            controller.animateTo(tabIndex);
          });
        } // if
      },

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

} // end class




