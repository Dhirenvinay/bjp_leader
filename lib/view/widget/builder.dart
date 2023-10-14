import 'package:bjp_leader/view/widget/videoplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoListWithPlayButton extends StatelessWidget {
  final List<String> youtubedata;

  VideoListWithPlayButton({
    required this.youtubedata,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth * 0.25;
    double itemHeight = itemWidth * 0.8;

    return SizedBox(
      height: itemHeight + 90,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: youtubedata.length,
        itemBuilder: (context, index) {
          var videoUrl = youtubedata[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(), // Adjust as needed
              child: VideoItemWithPlayButton(
                videoUrl: videoUrl,
                itemWidth: itemWidth,
                itemHeight: itemHeight,
              ),
            ),
          );
        },
      ),
    );
  }
}

class VideoItemWithPlayButton extends StatelessWidget {
  final String videoUrl;
  final double itemWidth;
  final double itemHeight;

  const VideoItemWithPlayButton({
    required this.videoUrl,
    required this.itemWidth,
    required this.itemHeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => VideoPlayerScreen(videoUrl: videoUrl));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              YoutubePlayer.getThumbnail(
                quality: ThumbnailQuality.high,
                videoId: videoUrl,
              ),
              fit: BoxFit.cover,
            ),
            Container(
              width: itemWidth / 1.5,
              height: itemHeight / 1.5,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Image.asset("assets/icons/ytplay.png"),
            ),
          ],
        ),
      ),
    );
  }
}
