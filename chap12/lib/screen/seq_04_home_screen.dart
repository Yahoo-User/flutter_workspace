import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../util/logger.dart';

import './seq_05_logo.dart';
import './seq_06_app_name.dart';


class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    // @override
    // // *Important: don't put any logic in 'createState'.
    // State<HomeScreen> createState() {       // 1
    //     return _HomeScreenState();
    // } // createState

    @override
    State<HomeScreen> createState() => _HomeScreenState();      // 2
} // end class



// import '';      // XX : Directives must appear before any declarations.

class _HomeScreenState extends State<HomeScreen> {
    // XFile :
    //      (1) A CrossFile is a cross-platform, simplified File abstraction.
    //      (2) It wraps the bytes of a selected file, and its (platform-dependant) path.

    // late XFile videoFile;      // 1 - XX
    // late XFile? videoFile;    // 2 - OK
    XFile? videoFile;            // 3 - OK


    _HomeScreenState() {
        console('Default Constructor Invoked.');
    } // Default Constructor

    @override
    Widget build(BuildContext context) {
        console('build(videoFile: $videoFile, context: $context) invoked.');

        // Scaffold: creates a visual scaffold for Material Design widgets.
        return Scaffold(
            backgroundColor: Colors.black,
            body: (videoFile == null) ? _renderEmpty() : _renderVideo(),
        );
    } // build

    Widget _renderEmpty() {     // Returns a widget *before selection of a video file.
        console('_renderEmpty(videoFile: $videoFile) invoked.');

        // Container: creates a widget that combines common painting, positioning, and sizing widgets.
        return Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,

            child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                    Logo(),
                    SizedBox(height: 30.0, ),
                    AppName(),
                ],
            ),
        );
    } // renderEmpty


    Widget _renderVideo() {     // Returns a widget *After selection of a video file.
        console('_renderVideo(videoFile: $videoFile) invoked.');

        // Container: creates a widget that combines common painting, positioning, and sizing widgets.
        return Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
        );
    } // renderVideo

} // end class




