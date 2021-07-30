import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class UrlVideo extends StatefulWidget {
  @override
  _UrlVideoState createState() => _UrlVideoState();
}

class _UrlVideoState extends State<UrlVideo> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  initState() {
    _controller = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    print(_controller);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Video Player"),
          backgroundColor: Colors.brown.shade500,
        ),
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
        ));
  }
}
