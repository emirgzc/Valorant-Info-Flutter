import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SoundPage extends StatefulWidget {
  const SoundPage(
      {Key? key,
      required this.sound,
      required this.imageBack,
      required this.imageBack2,
      required this.color})
      : super(key: key);
  final String sound;
  final String imageBack;
  final String imageBack2;
  final String color;

  @override
  State<SoundPage> createState() => _SoundPageState();
}

class _SoundPageState extends State<SoundPage> {
  VideoPlayerController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.sound)
      ..initialize().then(
        (_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("----${widget.sound}");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _controller!.value.isInitialized
            ? Stack(
                children: [
                  Image.network(
                    widget.imageBack2,
                    fit: BoxFit.contain,
                    color: Color(
                      int.parse(
                        "0xff${widget.color.substring(0, 6)}",
                      ),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio * 0.7,
                    child: Image.network(
                      widget.imageBack,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              )
            : Container(),
      ),
      floatingActionButton: buttonSound(),
    );
  }

  Widget buttonSound() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _controller!.value.isPlaying
              ? _controller!.pause()
              : _controller!.play();
        });
      },
      backgroundColor: Color(
        int.parse(
          "0xff${widget.color.substring(0, 6)}",
        ),
      ),
      child: Icon(
        _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
      ),
    );
  }

  Widget soundBody() {
    return Center(
      child: _controller!.value.isInitialized
          ? Stack(
              children: [
                Image.network(
                  widget.imageBack2,
                  fit: BoxFit.contain,
                  color: Color(
                    int.parse(
                      "0xff${widget.color.substring(0, 6)}",
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio * 0.7,
                  child: Image.network(
                    widget.imageBack,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
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
