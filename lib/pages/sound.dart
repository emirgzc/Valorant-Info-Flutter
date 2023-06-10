import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valoinfos/constants/handle_excepiton.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/widgets/custom_appbar.dart';
import 'package:valoinfos/widgets/packages/cache_image.dart';
import 'package:video_player/video_player.dart';

class SoundPage extends StatefulWidget {
  const SoundPage({Key? key, required this.sound, required this.imageBack, required this.imageBack2, required this.color})
      : super(key: key);
  final String sound;
  final String imageBack;
  final String imageBack2;
  final String color;

  @override
  State<SoundPage> createState() => _SoundPageState();
}

class _SoundPageState extends State<SoundPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _playVideo(init: true);
  }

  void _playVideo({bool init = false}) {
    try {
      _controller = VideoPlayerController.network(widget.sound)
        ..addListener(() => setState(() {}))
        ..setLooping(true)
        ..initialize().then((value) => _controller.play());
    } catch (e) {
      HandleException.handle(context: context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("----${widget.sound}");
    return Scaffold(
      appBar: CustomAppBar(
        foregroundColor: Color(
          int.parse(
            "0xff${widget.color.substring(0, 6)}",
          ),
        ),
      ),
      body: body(),
      floatingActionButton: buttonSound(),
    );
  }

  Widget body() {
    return Center(
      child: _controller.value.isInitialized
          ? Stack(
              children: [
                CacheImage(
                  image: widget.imageBack2,
                  fit: BoxFit.contain,
                  color: Color(
                    int.parse(
                      "0xff${widget.color.substring(0, 6)}",
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio * 0.72,
                  child: CacheImage(
                    image: widget.imageBack,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          : Container(),
    );
  }

  Widget buttonSound() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _controller.value.isPlaying ? _controller.pause() : _controller.play();
        });
      },
      backgroundColor: Color(
        int.parse(
          "0xff${widget.color.substring(0, 6)}",
        ),
      ),
      child: SvgPicture.asset(
        _controller.value.isPlaying ? 'assets/icons/pause.svg' : 'assets/icons/play.svg',
        height: Style.defaullIconHeight,
      ),
    );
  }

  Widget soundBody() {
    return Center(
      child: _controller.value.isInitialized
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
                  aspectRatio: _controller.value.aspectRatio * 0.7,
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
}
