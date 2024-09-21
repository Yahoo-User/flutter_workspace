import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../util/logger.dart';
import './seq_15_custom_icon_button.dart';


class CustomVideoPlayer extends StatefulWidget {
    final XFile videoFile;

    // typedef GestureTapCallback = void Function()
    final GestureTapCallback onNewVideoSelect;


    // *Important: Named parameters can't start with an underscore.
    const CustomVideoPlayer({
        required this.videoFile,
        required this.onNewVideoSelect,

        super.key,
    });

    @override
    State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
} // end class


class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
    VideoPlayerController? videoPlayerController;  // State field
    bool isPlaying = false;     // Toggle
    bool showControls = true;  // Toggle


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
        videoPlayerController.addListener(videoPlayerControllerListener);
        videoPlayerController.setLooping(true);

        setState(() {   // Update state field.
            this.videoPlayerController = videoPlayerController;
        }); // setState
    } // _initializeVideoPlayerController

    void videoPlayerControllerListener() {
        console('videoPlayerControllerListener() invoked.');

        console('\t+ videoPlayController.value: ${videoPlayerController?.value}');
        setState(() => console('\t+ Update state fields.'));
    } // videoPlayerControllerListener

    /*
     * ----------------------
     * covariant
     * ----------------------
     * The `covariant` keyword in Dart allows specifying a more specific type for parameters
     * when overriding methods in an inheritance hierarchy.
     *
     * Example:

        class Animal {
            void eat(Food food) {
                print('Animal is eating $food');
            } // eat
        } // Animal

        class Food {}  // Food

        class Grass extends Food {} // Grass

        class Carnivore extends Animal {
            // Grass extends Food : more detailed sub-type specified with covariant keyword. (***)
            void eat(covariant Grass grass) { // covariant used.
                print('Carnivore is eating $grass');
            } // eat
        } // end class
     */
    @override
    // Called whenever the widget configuration (fields) changes.
    void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
        console('didUpdateWidget($oldWidget) invoked.');
        super.didUpdateWidget(oldWidget);                   // *Required at first statement.

        if(oldWidget.videoFile.path != widget.videoFile.path) {
            _initializeVideoPlayerController();
        } // if
    } // didUpdateWidget

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

        return GestureDetector( // To detect tap for the whole video player, wrap all sub widgets.
            onTap: () {
                console('GestureDetector.onTap() invoked.');
                
                setState(() {
                    // toggle switch whether showing video controls.
                    showControls = !showControls;
                });
            },
            
            child: AspectRatio(
                aspectRatio: videoPlayerController!.value.aspectRatio,

                child: Stack(
                    children: <Widget>[     // List<Widget>
                        // VideoPlayer: uses the given controller for all video rendered in this widget.
                        VideoPlayer(videoPlayerController!),
                        
                        if(showControls)
                            // Container: creates a widget that combines common painting, positioning, and sizing widgets.
                            Container(color: Colors.black.withOpacity(.2)),
                            
                        // Positioned: creates a widget that controls where a child of a Stack is positioned.
                        Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,

                            child: Padding(
                                // EdgeInsets.symmetric: creates insets with symmetrical vertical and horizontal offsets.
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),

                                child: Row(
                                    children: <Widget>[
                                        renderTimeTextFromDuration(videoPlayerController!.value.position),

                                        Expanded(
                                            child: Slider(
                                                min: 0.0,

                                                max: videoPlayerController!.value.duration.inSeconds.toDouble(),

                                                // value: required double
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

                                        renderTimeTextFromDuration(videoPlayerController!.value.duration),
                                    ],
                                ),
                            ),
                        ),

                        if(showControls)
                            // Align: creates an alignment widget.
                            // The alignment defaults to Alignment.center.
                            Align(
                                alignment: Alignment.topRight,

                                child: CustomIconButton(
                                    iconData: Icons.photo_camera_back,
                                    onPressed: widget.onNewVideoSelect,
                                ),
                            ),

                        if(showControls)
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

                                        if(!isPlaying)
                                            CustomIconButton(
                                                iconData: Icons.play_arrow,
                                                onPressed: _onPlayArrow,
                                            ),

                                        if(isPlaying)
                                            CustomIconButton(
                                                iconData: Icons.ac_unit,
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
            ),
        );
    } // build

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

        if(videoPlayerController!.value.isPlaying) {    // If playing,
            videoPlayerController!.pause();
        } else {    // If paused,
            videoPlayerController!.play();
        } // if-else

        setState(() {
            isPlaying = !isPlaying;
        });
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

    Widget renderTimeTextFromDuration(Duration duration) {
        console('renderTimeTextFromDuration($duration) invoked.');

        return Text(
            "${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}",
            style: const TextStyle(color: Colors.white),
        );
    } // renderTimeTextFromDuration

} // end class



