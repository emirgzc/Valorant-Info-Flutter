import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "pleaseWaitVideo".tr(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      body: videoBody(),
      floatingActionButton: videoButton(),
    );
  }

  Widget videoButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _controller!.value.isPlaying
              ? _controller!.pause()
              : _controller!.play();
        });
      },
      child: Icon(
        _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
      ),
    );
  }

  Widget videoBody() {
    return Center(
      child: _controller!.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio * (3 / 4),
              child: VideoPlayer(_controller!),
            )
          : Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
