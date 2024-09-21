import 'package:chap08/screen/home_widget.dart';

import './util/logger.dart';
import 'package:flutter/material.dart';


/*
 * ===============================================================================
 * Configure `INTERNET`, `https` and `http` protocol permissions for using `WebView` Widget  in Android & IOS.
 * ===============================================================================
 *  (1) Android
 *
 *  1-1. project > android > app > main > AndroidManifest.xml
 *      In <manifest> top-level tag :
 *          <uses-permission android:name="android.permission.INTERNET"/>   <--- added. ①
 *
 *          <application
 *              ...
 *              android:usesCleartextTraffic="true" >   <--- added. ②
 *              ...
 *          </application>
 *
 *  1-2. project > android > app > build.gradle
 *      In  android {
 *            ...
 *            compileSdkVersion 34        <--- added. ①
 *            ...
 *            defaultConfig {
 *                ...
 *                minSdkVersion 28            <--- added. ②
 *                ...
 *            }
 *            ...
 *      }
 *
 *  (2) iOS
 *
 *    2-1. project > ios > Runner > info.plist
 *
 *      <plist version="1.0">
 *          ...
 *          <dict>
 *                  ...
 *                  <!-- Added -->
 *                  <key>NSAppTransportSecurity</key>
 *                   <dict>
 *                        <key>NSAllowsLocalNetworking</key>
 *                        <true/>
 *                        <key>NSAllowsArbitraryLoadsInWebContent</key>
 *                        <true/>
 *                   </dict>
 *                   ...
 *          </dict>
 *          ...
 *      </plist>
 *
 */

// *Important: the file name must be a lower_case_with_underscores identifier.

void main(List<String> args) {
      console('main($args, ${args.length}) invoked.');

      /**
       * ============================================
       * Inside `runApp()` function, runs the following code,
       *      final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
       * ============================================
       *  (1) `WidgetsFlutterBinding` class means like the following:
       * ============================================
       *  A concrete binding for applications based on the Widgets framework.
       *  This is the glue that binds the framework to the Flutter engine.
       *
       *  When using the widgets framework, this binding, or one that implements the same interfaces, must be used.
       *  The following mixins are used to implement this binding:
       *
       *    1. GestureBinding:        implements the basics of hit testing.
       *    2. SchedulerBinding:    introduces the concepts of frames.
       *    3. ServicesBinding:       provides access to the plugin subsystem.
       *    4. PaintingBinding:       enables decoding images.
       *    5. SemanticsBinding:    supports accessibility.
       *    6. RendererBinding:     handles the render tree.
       *    7. WidgetsBinding:       handles the widget tree.  (***)
       *
       * ============================================
       *  (2) WidgetsFlutterBinding.ensureInitialized();
       * ============================================
       *  runApp를 호출하기 전에, 바인딩이 초기화 되어야 할 필요가 있는 경우,
       *  WidgetsBinding을 구현하는 바인딩의 인스턴스를 반환합니다.
       * 아직 바인딩이 초기화 되지 않은 경우, WidgetsFlutterBinding 클래스를 사용하여, 하나를 생성하고 초기화 합니다.
       */

      // Waiting until flutter framework will be ready to run this App.  (***)
      // Returns WidgetsBinding
      WidgetsFlutterBinding.ensureInitialized();

      runApp(MaterialApp(
          home: HomeWidget(),
      ));

      return;
}

