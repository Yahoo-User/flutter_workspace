import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../util/logger.dart';
import './seq_15_custom_icon_button.dart';


class CustomVideoPlayer extends StatefulWidget {
    final XFile videoFile;


    // *Important: Named parameters can't start with an underscore.
    const CustomVideoPlayer({   // Constructor with required named parameters.
        required this.videoFile,
        super.key
    });

    @override
    State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
} // end class


class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
    VideoPlayerController? videoPlayerController;  // State field


    @override
    void initState() {
        console('initState() invoked.');
        super.initState();  // *Required, first called.

        _initializeVideoPlayerController();
    } // initState

    // dynamic _initializeVideoPlayerController()
    _initializeVideoPlayerController() async {
        console('_initializeVideoPlayerController() invoked.');

        final videoPlayerController =  VideoPlayerController.file(File(widget.videoFile.path), );
        await videoPlayerController.initialize();

        setState(() {   // Update state field.
            console('Updated videoPlayerController.');
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
        } // if-else

        return AspectRatio(
            aspectRatio: videoPlayerController!.value.aspectRatio,

            child: Stack(
                children: <Widget>[     // List<Widget>

                    // VideoPlayer: uses the given controller for all video rendered in this widget.
                    VideoPlayer(videoPlayerController!, ),

                    // Positioned: creates a widget that controls where a child of a Stack is positioned.
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

                    // Align: creates an alignment widget.
                    // The alignment defaults to Alignment.center.
                    Align(
                        alignment: Alignment.topRight,

                        child: CustomIconButton(
                            iconData: Icons.photo_camera_back,
                            onPressed: () {
                                console('Icons.photo_camera_back::onPressed() invoked.');
                            },
                        ),
                    ),

                    // Align: creates an alignment widget.
                    // The alignment defaults to Alignment.center.
                    Align(
                        alignment: Alignment.center,

                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: <CustomIconButton>[
                                CustomIconButton(
                                    iconData: Icons.rotate_left,
                                    onPressed: () {
                                        console('Icons.rotate_left::onPressed() invoked.');
                                    },
                                ),

                                CustomIconButton(
                                    iconData: Icons.play_arrow,
                                    onPressed: () {
                                        console('Icons.play_arrow::onPressed() invoked.');
                                    },
                                ),

                                CustomIconButton(
                                    iconData: Icons.rotate_right,
                                    onPressed: () {
                                        console('Icons.rotate_right::onPressed() invoked.');
                                    },
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    } // build

} // end class



