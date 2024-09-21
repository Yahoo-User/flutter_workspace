import 'util/logger.dart';
import 'package:flutter/material.dart';


void main() {
      console('main() invoked.');

      // Use 'const' with the constructor to improve performance.
      runApp(const App());
      return;
}


class App extends StatelessWidget {

      // *Important: const constructors can't have a body.
      // *Important: the constructor being called isn't a `const` constructor.
      // *Important: Constructors for public widgets should have a named 'key' parameter. (***)
      // Constructors in '@immutable' classes should be declared as 'const'.
      const App({super.key});

      @override
      Widget build(BuildContext context) {
            console('build($context) invoked.');

            // *Important: the constructor being called isn't a const constructor.
            return MaterialApp(
                  home: Scaffold(
                      backgroundColor: Colors.white,

                      body: Container(
                          decoration: const BoxDecoration(
                              color: Colors.orange,
                          ) ,

                          child: const Center(
                            child: Text("Splash Screen"),
                          ),
                      ),
                  ),
            );
      } // build

} // end class

