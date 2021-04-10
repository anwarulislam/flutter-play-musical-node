import 'package:flutter/material.dart';
import 'package:tenms/constants.dart';
import 'package:wakelock/wakelock.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: AudioBar()),
      ),
    );
  }
}

class AudioBar extends StatelessWidget {
  void playAudio(int audio) async {
    var player = await AudioCache(prefix: 'assets/audio/');
    if (player != null) {
      player.play('note$audio.wav');
    }
  }

  Expanded createMusicBar(Color color, int audio) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playAudio(audio);
        },
        child: Container(color: color),
        style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        createMusicBar(Colors.red, 1),
        createMusicBar(Colors.green, 2),
        createMusicBar(Colors.blue, 3),
        createMusicBar(Colors.teal, 4),
        createMusicBar(Colors.yellow, 5),
        createMusicBar(Colors.brown, 6),
        createMusicBar(Colors.orange, 7),
      ],
    );
  }
}
