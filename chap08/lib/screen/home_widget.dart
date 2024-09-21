import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../util/logger.dart';


// *Important: the file name must be a lower_case_with_underscores identifier.

class HomeWidget extends StatelessWidget {
      // static final WebViewController webViewController = WebViewController();

      final WebViewController webViewController =  WebViewController()
                  // returns Future<void>
                  ..loadRequest(Uri.parse('https://naver.com'), method: LoadRequestMethod.get)
                  // returns Future<void>
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..setNavigationDelegate(NavigationDelegate(
                        onPageStarted: (String? url) {
                              console('NavigationDelegate::onPageStarted($url) invoked.');
                        },
                        onPageFinished: (String? url) {
                              console('NavigationDelegate::onPageFinished($url) invoked.');
                        },
                        onProgress: (int? progress) {
                              console('NavigationDelegate::onProgress($progress) invoked.');
                        },
                        onUrlChange: (UrlChange? urlChange) {
                              console('NavigationDelegate::onUrlChange($urlChange) invoked.');
                        },
                        onWebResourceError: (WebResourceError? error) {
                              console('NavigationDelegate::onWebResourceError($error) invoked.');
                        },
                  ));

      // --------------------------------
      // *Important: const constructors can't have a body. (***)
      // *Important: the constructor being called isn't a `const` constructor. (***)
      // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
      // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
      // --------------------------------

      // (1) Can't define the 'const' constructor because the field 'webViewController' is initialized with a non-constant value.
      // (2) Can define the `const` constructor because the field `static final` 'WebViewController' declared.
      HomeWidget({super.key});
      // const HomeWidget({Key? key}): super(key: key);

      @override
      Widget build(BuildContext context) {
            console('build($context) invoked.');

            return Scaffold(
                  backgroundColor: Colors.white,

                  appBar: AppBar(
                        backgroundColor: Colors.amber,
                        toolbarHeight: 100.0,

                        centerTitle: true,
                        title: const Text('Web App'),
                        titleTextStyle: const TextStyle(
                              color: Colors.white,
                              letterSpacing: 5.0,

                              fontFamily: 'D2Coding',
                              fontSize: 34.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                        ),

                        actions: <Widget>[  // List
                              IconButton(
                                    onPressed: () {
                                          console('>>> IconButton::onPressed() invoked.');
                                          webViewController.goBack();
                                    },
                                    icon: const Icon(
                                          Icons.keyboard_double_arrow_left,
                                          size: 30.0,
                                          color: Colors.white,
                                    ),
                              ),

                              IconButton(
                                  onPressed: () {
                                        console('>>> IconButton::onPressed() invoked.');
                                        webViewController.loadRequest(Uri.parse('https://naver.com'));
                                  },
                                  icon: const Icon(
                                        Icons.home_work_outlined,
                                        size: 24.0,
                                        color: Colors.white,
                                  ),
                              ),

                              IconButton(
                                  onPressed: () {
                                        console('>>> IconButton::onPressed() invoked.');
                                        webViewController.goForward();
                                  },
                                  icon: const Icon(
                                        Icons.keyboard_double_arrow_right,
                                        size: 30.0,
                                        color: Colors.white,
                                  ))
                        ],
                  ),

                  body: WebViewWidget(
                        controller: webViewController,
                  ),
            );
      } // build

} // end class



