import 'package:pod_player/pod_player.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatefulWidget {
  final String videoUrl;
  const VideoCard({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      podPlayerConfig: const PodPlayerConfig(
          autoPlay: true, isLooping: true, forcedVideoFocus: false),
      playVideoFrom: PlayVideoFrom.network(
        // videoPlayerOptions: VideoPlayerOptions()
        widget.videoUrl,
      ),
    )..initialise().whenComplete(() {
        controller.mute();
      });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        PodVideoPlayer(
            alwaysShowProgressBar: false,
            matchVideoAspectRatioToFrame: true,
            frameAspectRatio: 16 / 9,
            videoAspectRatio: 16 / 9,
            controller: controller,
            videoThumbnail:
                const DecorationImage(image: AssetImage("assets/logo.png"))),
        controller.isMute
            ? IconButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  controller.unMute();
                  setState(() {});
                },
                icon: const Icon(
                  Icons.volume_off_rounded,
                  color: Colors.white,
                  size: 40,
                ))
            : IconButton(
                onPressed: () {
                  controller.mute();
                  setState(() {});
                },
                icon: const Icon(
                  Icons.volume_up_outlined,
                  color: Colors.white,
                  size: 40,
                ))
      ],
    );
  }
}
