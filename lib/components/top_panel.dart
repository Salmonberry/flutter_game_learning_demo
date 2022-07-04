import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import '../main_scene.dart';

class TopPanel extends StatefulWidget {
  static const id = 'top_panel';
  final MainScene gameRef;

  const TopPanel(this.gameRef, {Key? key}) : super(key: key);

  @override
  State<TopPanel> createState() => _TopPanelState();
}

class _TopPanelState extends State<TopPanel> {
  bool _hasOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FlameAudio.bgm.initialize();

    FlameAudio.bgm.audioPlayer.onPlayerStateChanged.listen((currentState) {
      print('isPlaying:${FlameAudio.bgm.isPlaying}');
      print('currentState:$currentState');
      print(
          'FlameAudio.bgm.audioPlayer.state:${FlameAudio.bgm.audioPlayer.state}');
    });

    playBGMMusic();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    FlameAudio.bgm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.play_circle),
            onPressed: onBGMButtonTaped,
          ),
          Text('${_hasOpen ? 'Open' : 'Close'} Music')
        ],
      ),
    );
  }

  void onBGMButtonTaped() {
    setState(() {
      if (FlameAudio.bgm.audioPlayer.state.index == 1) {
        FlameAudio.bgm.audioPlayer.pause();
        _hasOpen = false;
      } else {
        FlameAudio.bgm.audioPlayer.resume();
        _hasOpen = true;
      }
    });
  }

  Future<void> playBGMMusic() async {
    // FlameAudio.bgm.initialize();
    await FlameAudio.bgm.play('background.mp3');
    print('isPlaying:${FlameAudio.bgm.isPlaying}');
    setState(() {
      _hasOpen = FlameAudio.bgm.isPlaying;
    });
  }
}
