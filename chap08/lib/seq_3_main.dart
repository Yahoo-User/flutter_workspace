import 'package:chap08/util/logger.dart';
import 'package:flutter/material.dart';

import './screen/home_screen.dart';


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
//                      minSdkVersion 28            <--- added. ②
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

void main(List<String> args) {
    console('main($args, ${args.length}) invoked.');

    runApp(const MaterialApp(
        home: HomeScreen(),
    ));

    return;
}

