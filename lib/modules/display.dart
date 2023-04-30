import 'package:flutter/material.dart';
import 'package:movie_app/models/api_models/movie_model.dart';
import 'package:movie_app/shared/styles/icon_broken.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Display extends StatefulWidget {
  Movie movie;

  Display({Key? key, required this.movie}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.movie.trailer);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            IconBroken.Arrow___Left,
          ),
        ),
        title: Text(
          'Trailer',
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
            ),
            builder: (context, player) => YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              bottomActions: [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                ),
                const PlaybackSpeedButton(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.movie.title,
                    style: Theme.of(context).textTheme.headline1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.movie.year}',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
