import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {

  final String videoPath;

  const VideoPlayerWidget({
    super.key,
    required this.videoPath,
  });

  @override
  State<VideoPlayerWidget> createState() =>
      _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState
    extends State<VideoPlayerWidget> {

  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller =
    VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (!controller.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(20),

          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,

            child: VideoPlayer(controller),
          ),
        ),

        const SizedBox(height: 12),

        ElevatedButton.icon(

          onPressed: () {

            setState(() {

              controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
            });
          },

          icon: Icon(
            controller.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow,
          ),

          label: Text(
            controller.value.isPlaying
                ? "Pause"
                : "Play",
          ),
        ),
      ],
    );
  }
}