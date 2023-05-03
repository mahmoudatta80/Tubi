import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Display extends StatefulWidget {
  String trailer;
  Display({Key? key,required this.trailer}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.trailer);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Theme.of(context).primaryColor,
          ),
          builder: (context, player) => player,
          onEnterFullScreen: () {
            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: [],
            );
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]);
          },
          onExitFullScreen: () {
            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: SystemUiOverlay.values,
            );
            SystemChrome.setPreferredOrientations(
              DeviceOrientation.values,
            );
          },
        ),
      ),
    );
  }
}
