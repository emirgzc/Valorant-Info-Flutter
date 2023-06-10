import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valoinfos/constants/enums.dart';
import 'package:valoinfos/constants/extension.dart';
import 'package:valoinfos/constants/handle_excepiton.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/widgets/custom_appbar.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
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
      _controller = VideoPlayerController.network(widget.videoUrl)
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
    return Scaffold(
      appBar: const CustomAppBar(),
      body: videoBody(),
      floatingActionButton: videoButton(),
    );
  }

  Widget videoButton() {
    return FloatingActionButton(
      backgroundColor: Style.primaryColor,
      onPressed: () => _controller.value.isPlaying ? _controller.pause() : _controller.play(),
      child: SvgPicture.asset(
        _controller.value.isPlaying ? IconPath.pause.name.iconPath : IconPath.play.name.iconPath,
        color: Style.whiteColor,
        height: Style.defaultPaddingSize * 2,
      ),
    );
  }

  Widget videoBody() {
    return Padding(
      padding: Style.pagePadding / 2,
      child: Column(
        children: [
          Container(
            child: _controller.value.isInitialized
                ? Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 600.h,
                            child: VideoPlayer(_controller),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: _fullScreenButon(),
                          )
                        ],
                      ),
                      SizedBox(height: Style.defaultPaddingSize),
                      _valueProgress(),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _fullScreenButon() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/${PageNameEnum.landPage.name}',
          arguments: _controller,
        );
      },
      child: Container(
        margin: EdgeInsets.all(Style.defaultPaddingSize * 0.3),
        color: Style.darkTextColor,
        child: Icon(
          Icons.fullscreen,
          color: Colors.white,
          size: Style.iconSizeTv * 1.2,
        ),
      ),
    );
  }

  Widget _valueProgress() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: _controller,
          builder: (context, VideoPlayerValue value, child) {
            return Text(
              _videoDuration(value.position),
              style: context.theme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Style.primaryColor,
              ),
            );
          },
        ),
        Expanded(
          child: SizedBox(
            height: 40.h,
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: Style.defaultPaddingSize / 2,
              ),
            ),
          ),
        ),
        Text(
          _videoDuration(_controller.value.duration),
          style: context.theme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
