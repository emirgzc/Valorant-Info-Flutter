import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class LandScapePlayerPage extends StatefulWidget {
  const LandScapePlayerPage({super.key, required this.controller});
  final VideoPlayerController controller;

  @override
  State<LandScapePlayerPage> createState() => _LandScapePlayerPageState();
}

class _LandScapePlayerPageState extends State<LandScapePlayerPage> {
  Future<void> _landScapeMode() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future<void> _setAllOrientation() async {
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  @override
  void initState() {
    super.initState();
    _landScapeMode();
  }

  @override
  void dispose() {
    _setAllOrientation();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(widget.controller);
  }
}
