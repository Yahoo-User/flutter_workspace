import 'package:flutter/material.dart';
import '../util/logger.dart';

import 'dart:math';
import 'package:shake/shake.dart';

import '../const/seq_1_colors.dart';
import './seq_11_settings_screen.dart';
import './seq_9_homescreen_2.dart';



class RootScreen extends StatefulWidget {  // With state management.

    const RootScreen({super.key});

    @override
    State<RootScreen> createState() => _RootScreenState();

} // end class


class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
    // TabController? controller;       // 1
    late TabController controller;   // 2

    double threshold = 2.7;     // Default Sensitivity
    int diceNumber = 3;     // Default Dice Number

    ShakeDetector? shakeDetector;


    // A constant constructor can't call a non-constant super constructor.
    // const              // XX
    _RootScreenState() {
        console('Default Constructor Invoked.');
    } // Default Constructor

    @override
    void initState() {    // Only once called back when this RootScreen widget registered to the widget tree.
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

        // ShakeDetector.autoStart:
        //      This constructor automatically calls startListening and starts detection and callbacks.
        shakeDetector = ShakeDetector.autoStart(

            /*
             * Default value of the Shake Detector:
             *      this.shakeThresholdGravity = 2.7,
             *      this.shakeSlopTimeMS = 500,
             *      this.shakeCountResetTime = 3000,
             *      this.minimumShakeCount = 1,
             */
            shakeSlopTimeMS: 100,                           // Detection Interval In Milliseconds.
            shakeThresholdGravity: threshold,       // Detection Sensitivity.

            // PhoneShakeCallback onPhoneShake
            //      typedef void PhoneShakeCallback();
            onPhoneShake: onPhoneShake

        );  // autoStart
  } // initState

    void tabListener() {  // Change state
        console('tabListener() invoked: controller.index: ${controller.index}');

        // Set dirty state -> cause build() method to re-render and set clean state.
        setState(() => console('\t+ setState callback invoked.'));
    } // tabListener

    void onPhoneShake() {
        console('onPhoneShake() invoked.');

        setState(() {   // Change dice number in random.
            int min = 1, max = 6;

            diceNumber = (Random().nextDouble() - (max - min)) .toInt() + min;      // 1 <= x <= 6, (min = 1, max = 6)
        });
    }   // onPhoneShake

    @override
    void dispose() {
        console('dispose() invoked.');

        // TabController.removeListener:
        //    The TabController Listener must be remove whenever this RootScreen widget disposed from the widget tree.

        // Try making the call conditional (using '?.') or adding a null check to the target ('!').
        // controller!.removeListener(tabListener);    // XX, The '!' will have no effect because the receiver can't be null.
        controller.removeListener(tabListener);
        console('\t+ tabListener removed from tabController');

        // ShakeDetector.stopListening method: stops listening to accelerometer events

        // Try making the call conditional (using '?.') or adding a null check to the target ('!').
        // shakeDetector?.stopListening();
        shakeDetector!.stopListening();

        super.dispose();    // *Required at last
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
            HomeScreen(diceNumber: diceNumber, ),
            SettingsScreen(threshold: threshold, onThresholdChange: onThresholdChange, ),
        ];
    } // renderChildren

    void onThresholdChange(double currentValue) {
        console('onThresholdChange($currentValue) invoked.');
        setState(() => threshold = currentValue); // Change state -> Dirty state -> build() invoked -> Clean state.
    } // onThresholdChange

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
                    }); // setState
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




