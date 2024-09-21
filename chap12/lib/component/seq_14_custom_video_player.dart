import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../util/logger.dart';


class CustomVideoPlayer extends StatefulWidget {
    final XFile videoFile;


    // *Important: Named parameters can't start with an underscore.
    const CustomVideoPlayer({ required this.videoFile, super.key });

    @override
    State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
} // end class


class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
    VideoPlayerController? videoPlayerController;  // State Field


    @override
    void initState() {
        console('initState() invoked.');

        super.initState();  // *Required, first called.
        _initializeVideoPlayerController();
    } // initState

    // dynamic _initializeVideoPlayerController()
    _initializeVideoPlayerController() async {
        console('_initializeVideoPlayerController() invoked.');

        final videoPlayerController =   // Local variable
            VideoPlayerController.file(File(widget.videoFile.path), );

        await videoPlayerController.initialize();

        setState(() {   // Update state field.
            console('State videoController updated.');
            this.videoPlayerController = videoPlayerController;
        }); // setState
    } // _initializeVideoPlayerController

    @override
    Widget build(BuildContext context) {
        console('build(videoFile: ${widget.videoFile.path}, context: $context) invoked.');

        if(videoPlayerController == null) {
            return const Center(child: CircularProgressIndicator(color: Colors.white70, ), );
        } else {
            console('\t+ videoPlayerController: $videoPlayerController');

            /*
            console('\t(1) videoPlayerController: $videoPlayerController');
            console('\t(2) aspectRatio: ${videoPlayerController!.value.aspectRatio}');
            console('\t(3) Duration in seconds: ${videoPlayerController!.value.duration.inSeconds.toInt()}');
            console('\t(4) Current position: ${videoPlayerController!.value.position.inSeconds.toDouble()}');
             */
        } // if-else

        return AspectRatio(
            aspectRatio: videoPlayerController!.value.aspectRatio,

            child: Stack(
                children: <Widget>[     // List
                    VideoPlayer(videoPlayerController!, ),

                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,

                        child: Slider(
                            min: 0.0,
                            max: videoPlayerController!.value.duration.inSeconds.toDouble(),

                            // required double value
                            // The currently selected value for this slider.
                            // The slider's thumb is drawn at a position that corresponds to this value.
                            value: videoPlayerController!.value.position.inSeconds.toDouble(),

                            // The slider passes the new value to the callback but does not actually change state
                            // until the parent widget rebuilds the slider with the new value.
                            onChanged: (double value) {
                                console('Slider::onChanged($value) invoked.');

                                // Move the current position of the video to the passed seconds.
                                videoPlayerController!.seekTo( Duration( seconds: value.toInt() ) );

                                // To rebuild the slider with the new value
                                setState(() {});        // Update state.
                            },
                        ),
                    ),
                ],
            ),
        );
    } // build

} // end class



