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
            console('\t+ aspectRatio: ${videoPlayerController!.value.aspectRatio}');
        } // if-else

        return AspectRatio(
            aspectRatio: videoPlayerController!.value.aspectRatio,
            child: VideoPlayer(videoPlayerController!, ),
        );
    } // build

} // end class


