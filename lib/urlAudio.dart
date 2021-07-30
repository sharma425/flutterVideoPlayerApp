import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UrlAudio extends StatefulWidget {
  @override
  _UrlAudioState createState() => _UrlAudioState();
}

AudioPlayer audioPlayer = new AudioPlayer();
Duration duration = new Duration();
Duration position = new Duration();
bool playing = false;

class _UrlAudioState extends State<UrlAudio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade500,
        title: Text("Url Audio"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/picture/download.jpg",
          ),
          slider(),
          InkWell(
            onTap: () {
              getAudio();
            },
            child: Icon(
              playing == false
                  ? Icons.play_circle_outline
                  : Icons.pause_circle_outline,
              color: Colors.blue,
              size: 90,
            ),
          )
        ],
      ),
    );
  }

  Widget slider() {
    return Slider.adaptive(
      min: 0.0,
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          audioPlayer.seek(new Duration(seconds: value.toInt()));
        });
      },
    );
  }

  void getAudio() async {
    var url =
        "https://www.mediacollege.com/downloads/sound-effects/nature/forest/rainforest-ambient.mp3";
    //playing is false by defaule
    if (playing) {
      //pause song
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      //play song
      var res = await audioPlayer.play(url, isLocal: true);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }

    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }
}
