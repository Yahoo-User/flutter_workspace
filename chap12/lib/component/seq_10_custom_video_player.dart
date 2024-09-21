import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../util/logger.dart';


class CustomVideoPlayer extends StatefulWidget {
    final XFile videoFile;


    // *Important: Named parameters can't start with an underscore.
    const CustomVideoPlayer({ required this.videoFile, super.key });

    @override
    State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
} // end class


class _CustomVideoPlayerState extends State<CustomVideoPlayer> {

    @override
    Widget build(BuildContext context) {
        console('build(videoFile: ${widget.videoFile.path}, context: $context) invoked.');

        return const Center(
            child: Text(
                'CustomVideoPlayer',

                style: TextStyle(
                    color: Colors.white,

                    fontFamily: 'D2Coding',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                ),
            ),
        );
    } // build

} // end class


