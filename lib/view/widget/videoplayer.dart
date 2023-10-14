import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width, // Set your desired width
        height: MediaQuery.of(context).size.height, // Set your desired height
        child: YoutubePlayerBuilder(
          onExitFullScreen: () {},
          player: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
              flags: const YoutubePlayerFlags(
                autoPlay: true,
                mute: false,
              ),
            ),
          ),
          builder: (context, player) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add any additional UI elements here
                player,
              ],
            );
          },
        ),
      ),
    );
  }
}
