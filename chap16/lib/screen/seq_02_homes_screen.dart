import 'package:flutter/material.dart';
import '../util/logger.dart' show console;

import '../model/seq_03_video_model.dart' show VideoModel;
import '../component/seq_04_custom_youtube_player.dart' show CustomYoutubePlayer;


class HomeScreen extends StatelessWidget {
      const HomeScreen({super.key});

      @override
      Widget build(BuildContext context) {
          console('build($context) invoked.');

          return const Scaffold(
              backgroundColor: Colors.black,

              body: CustomYoutubePlayer(
                  videoModel: VideoModel(id: "E-qP5puRv1Q", title: "His Only Son (2023) Official Trailer")
              ),
          );
      }
}


