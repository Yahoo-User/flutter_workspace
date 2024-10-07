import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'
    show YoutubePlayerController, YoutubePlayerFlags, YoutubePlayer,ProgressBarColors;

import '../util/logger.dart';

import '../model/seq_03_video_model.dart';


class CustomYoutubePlayer extends StatefulWidget {
    final VideoModel videoModel;

    /* *Important: Can't define a const constructor for a class with non-final fields. */
    const CustomYoutubePlayer({
        required this.videoModel,
        super.key,
    });

    @override
    State<StatefulWidget> createState() => _CustomYoutubePlayerState();
}


class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
    YoutubePlayerController? controller;

    @override
    void initState() {
        console('initState() invoked.');
        super.initState();

        controller = YoutubePlayerController(
            initialVideoId: widget.videoModel.id,

            flags: const YoutubePlayerFlags(
                autoPlay: false,
                forceHD: true,
                showLiveFullscreenButton: true,
                controlsVisibleAtStart: false,
                mute: true,
            )
        );
    }

    @override
    void dispose() {
        console('dispose() invoked.');
        super.dispose();

        controller!.dispose();
    }

  @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        // return Container();

        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
                YoutubePlayer(                          // (1)
                    controller: controller!,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    progressColors: const ProgressBarColors(
                        playedColor: Colors.lightGreen,
                        handleColor: Colors.lightGreenAccent,
                    ),
                ),

                const SizedBox(height: 8.0),    // (2)

                Padding(                                    // (3)
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),

                    child: Text(
                        widget.videoModel.title,

                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'YES24',
                            fontSize: 12.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                ),

                const SizedBox(height: 16.0),   // (4)
            ],
        );
    }
}


