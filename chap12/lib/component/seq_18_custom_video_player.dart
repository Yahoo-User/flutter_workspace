import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../util/logger.dart';
import './seq_15_custom_icon_button.dart';


class CustomVideoPlayer extends StatefulWidget {
    final XFile videoFile;


    // *Important: Named parameters can't start with an underscore.
    const CustomVideoPlayer({required this.videoFile, super.key});

    @override
    State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
} // end class


class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
    VideoPlayerController? videoPlayerController;  // State field
    bool isPlaying = false;


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

        // VideoPlayerController.addListener(void Function() listener)
        videoPlayerController.addListener(videoPlayerControllerListener);   // <--- ***

        setState(() {   // Update state field.
            this.videoPlayerController = videoPlayerController;
        }); // setState
    } // _initializeVideoPlayerController

    void videoPlayerControllerListener() {
        console('videoPlayerControllerListener() invoked.');
        console('\t+ videoPlayController.value: ${videoPlayerController?.value}');

        setState(() => console('\t+ Update state fields.'));
    } // videoPlayerControllerListener

    @override
    void dispose() {
        console('dispose() invoked.');

        videoPlayerController!.removeListener(videoPlayerControllerListener);
        super.dispose();    // *Required and at last position.
    } // dispose

    @override
    Widget build(BuildContext context) {
        console('build(videoFile: ${widget.videoFile.path}, context: $context) invoked.');

        if(videoPlayerController == null) {
            return const Center(child: CircularProgressIndicator(color: Colors.white70));
        } // if

        return AspectRatio(
            aspectRatio: videoPlayerController!.value.aspectRatio,

            child: Stack(
                children: <Widget>[     // List<Widget>

                    // VideoPlayer: uses the given controller for all video rendered in this widget.
                    VideoPlayer(videoPlayerController!),

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
                                videoPlayerController!.seekTo(Duration(seconds: value.toInt()));
                            },
                        ),
                    ),

                    // Align: creates an alignment widget.
                    // The alignment defaults to Alignment.center.
                    Align(
                        alignment: Alignment.topRight,

                        child: CustomIconButton(
                            iconData: Icons.photo_camera_back,
                            onPressed: _onPhotoCameraBack,
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
                                    onPressed: _onRotateLeft,
                                ),

                                CustomIconButton(
                                    iconData: Icons.play_arrow,
                                    onPressed: _onPlayArrow,
                                ),

                                CustomIconButton(
                                    iconData: Icons.rotate_right,
                                    onPressed: _onRotateRight,
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    } // build

    void _onPhotoCameraBack() {
        console('_onPhotoCameraBack() invoked.');

    } // _onPhotoCameraBack

    void _onRotateLeft() {
        console('_onRotateLeft() invoked.');

        final currPos = videoPlayerController!.value.position;
        Duration newPos = const Duration(seconds: 0);

        if(currPos.inSeconds > 3) {
            newPos = currPos - const Duration(seconds: 3);
        } // if

        videoPlayerController!.seekTo(newPos);
    } // _onRotateLeft

    void _onPlayArrow() {
        console('_onPlayArrow() invoked.');

        isPlaying = !isPlaying;

        if(videoPlayerController!.value.isPlaying) {    // If playing,
            videoPlayerController!.pause();
        } else {    // If paused,
            videoPlayerController!.play();
        } // if-else
    } // _onPlayArrow

    void _onRotateRight() {
        console('_onRotateRight() invoked.');

        final maxPos = videoPlayerController!.value.duration;
        final currPos = videoPlayerController!.value.position;

        Duration newPos = maxPos;

        if( (maxPos - const Duration(seconds: 3)).inSeconds > currPos.inSeconds ) {
            newPos = currPos + const Duration(seconds: 3);
        } // if

        videoPlayerController!.seekTo(newPos);
    } // _onRotateRight

} // end class



