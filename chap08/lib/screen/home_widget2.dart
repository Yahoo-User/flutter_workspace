// *Important: the file name must be a lower_case_with_underscores identifier.

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../util/logger.dart';


const _home = "https://naver.com";

class HomeWidget extends StatelessWidget {
      late WebViewController _controller;

      // --------------------------------
      // *Important: const constructors can't have a body. (***)
      // *Important: the constructor being called isn't a `const` constructor. (***)
      // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
      // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
      // --------------------------------
      // const HomeWidget({Key? key}): super(key: key);
      HomeWidget({super.key}) {
            _controller = WebViewController()
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..setBackgroundColor(const Color(0x00000000))
                  ..setNavigationDelegate(NavigationDelegate(
                              onProgress: (int progress) {
                                    console('>>> onProgress($progress) invoked.');
                              },
                              onPageStarted: (String url) {
                                    console('>>> onPageStarted($url) invoked.');
                              },
                              onPageFinished: (String url) {
                                    console('>>> onPageFinished($url) invoked.');
                              },
                              onHttpError: (HttpResponseError error) {},
                              onWebResourceError: (WebResourceError error) {},
                              onNavigationRequest: (NavigationRequest request) {
                                    if (request.url.startsWith(_home)) {
                                          return NavigationDecision.prevent;
                                    }
                                    return NavigationDecision.navigate;
                              },
                        ),
                  )
                  ..loadRequest(Uri.parse(_home));
      } // Constructor


      @override
      Widget build(BuildContext context) {
            return Scaffold(
                  backgroundColor: Colors.white,

                  appBar: AppBar(
                        backgroundColor: Colors.amberAccent,
                        toolbarHeight: 100.0,

                        title: const Text('WebView2'),
                        centerTitle: true,
                        titleTextStyle: const TextStyle(
                              color: Colors.black,
                              letterSpacing: 5.0,

                              fontFamily: 'D2Coding',
                              fontSize: 30.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                        ),

                        actions: <Widget>[
                              IconButton(
                                  onPressed: () => _controller.goBack(),
                                  icon: const Icon(
                                          Icons.arrow_back,
                                          size: 24.0,
                              )),

                              IconButton(
                                    onPressed: () =>  _controller.loadRequest(Uri.parse(_home)),
                                    icon: const Icon(
                                          Icons.home_work,
                                          size: 24.0,
                                    ),
                              ),

                              IconButton(
                                    onPressed: () =>  _controller.goForward(),
                                    icon: const Icon(
                                          Icons.arrow_forward,
                                          size: 24.0,
                              ))
                        ],
                  ),

                  body: WebViewWidget(
                        controller:  _controller,

                        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                              Factory<VerticalDragGestureRecognizer>(
                                        () => VerticalDragGestureRecognizer(),
                              ),
                              Factory<ScaleGestureRecognizer>(
                                        () => ScaleGestureRecognizer(),
                              ),
                        },
                  ),
            );
      } // build

} // end class



