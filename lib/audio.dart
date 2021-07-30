import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

AudioPlayer newPlayer = new AudioPlayer();
AudioCache audio = new AudioCache(fixedPlayer: newPlayer);
bool play = false;
bool stop = true;

class Audio_Play extends StatefulWidget {
  @override
  _Audio_PlayState createState() => _Audio_PlayState();
}

class _Audio_PlayState extends State<Audio_Play> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio Player"),
        backgroundColor: Colors.brown.shade500,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.library_music),
            onPressed: () => print("keshav"),
          ),
          IconButton(
            icon: Icon(Icons.music_note),
            onPressed: () => print("keshav"),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 300,
            width: 300,
            child: Image.asset(
              "assets/picture/download.jpg",
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Container(
            height: 50,
            child: Text(
              "THIS IS ASSETS AUDIO",
              textScaleFactor: 2.0,
            ),
          ),
          Container(
            // width: 305,
            // color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  child: IconButton(
                    icon: Icon(
                      play == true ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      play == false
                          ? audio.play("/audios/Kalimba.mp3")
                          : newPlayer.pause();
                      setState(() {
                        play == true ? play = false : play = true;
                      });
                    },
                  ),
                ),
                SizedBox(width: 30),
                CircleAvatar(
                  radius: 30,
                  child: IconButton(
                    icon: Icon(
                      Icons.stop,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      newPlayer.stop();
                      setState(() {
                        play = false;
                        stop = true;
                      });
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
