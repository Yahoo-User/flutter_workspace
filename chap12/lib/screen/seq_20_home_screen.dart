import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../util/logger.dart';

import './seq_06_app_name.dart';
import './seq_08_logo.dart';

// import '../component/seq_19_custom_video_player.dart';
// import '../component/seq_21_custom_video_player.dart';
import '../component/seq_22_custom_video_player.dart';


class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
} // end class


class _HomeScreenState extends State<HomeScreen> {
    // XFile :
    // (1) A CrossFile is a cross-platform, simplified File abstraction.
    // (2) It wraps the bytes of a selected file, and its (platform-dependant) path.

    // late XFile
    XFile? videoFile;


    @override
    Widget build(BuildContext context) {
        console('build(videoFile: $videoFile, context: $context) invoked.');

        // Scaffold: creates a visual scaffold for Material Design widgets.
        return Scaffold(
            backgroundColor: Colors.black,
            body: (videoFile == null) ? _renderEmpty() : _renderVideo(),
        );
    } // build

    Widget _renderEmpty() {     // Returns a widget *Before selection of a video file.
        console('_renderEmpty(videoFile: $videoFile) invoked.');

        // Container: creates a widget that combines common painting, positioning, and sizing widgets.
        return Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,

            decoration: _getBoxDecoration(),

            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                    Logo(onNewVideoSelect: _onNewVideoSelect),
                    const SizedBox(height: 30.0),
                    const AppName(),
                ],
            ),
        );
    } // renderEmpty

    BoxDecoration _getBoxDecoration() {
        console('getBoxDecoration() invoked.');

        return const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

                colors: <Color>[
                    Color(0xff2a3a7c),
                    Color(0xff000118),
                ]
            ),
        );
    } // getBoxDecoration

    void _onNewVideoSelect() async {
        console('_onNewVideoSelect() async invoked.');

        final videoFile = await ImagePicker().pickVideo(source: ImageSource.gallery, );
        console('\t+ videoFile: $videoFile');

        if (videoFile != null) {
            setState(() => this.videoFile = videoFile); // setState
        } // if
    } // _onNewVideoSelect

    Widget _renderVideo() {     // Returns a widget *After selection of a video file.
        console('_renderVideo(videoFile: $videoFile!) invoked.');

        return Center(
            child: CustomVideoPlayer(
                videoFile: videoFile!,
                onNewVideoSelect: _onNewVideoSelect,
            ),
        );
    } // renderVideo

} // end class




