import 'util/logger.dart';
import 'package:flutter/material.dart';


// ===============================================================================
// Configure `INTERNET`, `https` and `http` protocol permissions for using `WebView` Widget  in Android & IOS.
// ===============================================================================
//
// -----------------------
//  (1) Android
// -----------------------
//  1-1. project > android > app > main > AndroidManifest.xml
//
//          In <manifest> top-level tag :
//              <uses-permission android:name="android.permission.INTERNET"/>   <--- added. ①

//              <application
//                  ...
//                  android:usesCleartextTraffic="true" >   <--- added. ②
//                  ...
//              </application>
//
//  1-2. project > android > app > build.gradle
//
//          In  android {
//                  ...
//                  compileSdkVersion 34        <--- added. ①
//                  ...
//                  defaultConfig {
//                      ...
//                      minSdkVersion 29            <--- added. ②
//                      ...
//                  }
//                  ...
//          }
//
// -----------------------
//  (2) iOS
// -----------------------
//  2-1. project > ios > Runner > info.plist
//
//          <plist version="1.0">
//                  ...
//                  <dict>
//                          ...
//                          <!-- Added -->
//                          <key>NSAppTransportSecurity</key>
//                          <dict>
//                                  <key>NSAllowsLocalNetworking</key>
//                                  <true/>
//                                  <key>NSAllowsArbitraryLoadsInWebContent</key>
//                                  <true/>
//                          </dict>
//                          ...
//                  </dict>
//                  ...
//          </plist>
// ===============================================================================

// *Important: the file name must be a lower_case_with_underscores identifier.

int main(List<String> args) {
    console('main($args, ${args.length}) invoked.');

    runApp(const MyApp());
    return 0;
}


// This widget is the root of your application.
class MyApp extends StatelessWidget {    // Only once executed, because of no state management.

  // --------------------------------
  // *Important: const constructors can't have a body. (***)
  // *Important: the constructor being called isn't a `const` constructor. (***)
  // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
  // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
  // --------------------------------

  // const MyApp({Key? key}) : super(key: key);
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Scaffold(
                backgroundColor: const Color(0xffffffff),

                appBar: AppBar(
                    backgroundColor: Colors.amber,
                    toolbarHeight: 100.0,

                    centerTitle: true,
                    title: const Text('Blog WebApp'),
                    titleTextStyle: const TextStyle(
                        color: Colors.black,
                        letterSpacing: 5.0,

                        fontFamily: 'D2Coding',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0
                    ),
                ),

                body: const Center(
                    child: Text('Blog WebApp'),
                ),
            )
        );
    } // build

} // end class



