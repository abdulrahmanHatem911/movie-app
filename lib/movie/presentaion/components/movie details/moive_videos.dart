import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../domain/entity/movie_vedio.dart';

class MovieVideosComponent extends StatefulWidget {
  final MovieVideo movieVideo;
  const MovieVideosComponent({super.key, required this.movieVideo});

  @override
  State<MovieVideosComponent> createState() => _MovieVideosComponentState();
}

class _MovieVideosComponentState extends State<MovieVideosComponent> {
  late bool _isPlayerReady;
  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;
  late YoutubePlayerController controller;
  void listener() {
    if (_isPlayerReady && mounted && !controller.value.isFullScreen) {
      setState(() {
        playerState = controller.value.playerState;
        videoMetaData = controller.metadata;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    videoMetaData = const YoutubeMetaData();
    playerState = PlayerState.paused;
    _isPlayerReady = false;
    controller = YoutubePlayerController(
      initialVideoId: widget.movieVideo.key,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    )..addListener(listener);
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.20,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: YoutubePlayer(
                onReady: () {
                  controller.addListener(listener);
                },
                showVideoProgressIndicator: true,
                controller: controller,
                progressColors: ProgressBarColors(
                  playedColor: Theme.of(context).tabBarTheme.labelColor,
                  handleColor:
                      Theme.of(context).tabBarTheme.unselectedLabelColor,
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ));
  }
}
