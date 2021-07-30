import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade500,
        title: Text("Player Option"),
        actions: [Icon(Icons.video_library), Icon(Icons.audiotrack_outlined)],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.amber.shade900),
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Row(
                  children: [
                    Icon(
                      Icons.audiotrack_rounded,
                      color: Colors.blue,
                    ),
                    FlatButton(
                      onPressed: () => Navigator.pushNamed(context, "/audio"),
                      child: Text("Local Audio"),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Icon(Icons.music_note_sharp),
                    FlatButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/urlAudio"),
                      child: Text("URL Audio"),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Icon(
                      Icons.video_collection_sharp,
                      color: Colors.blue,
                    ),
                    FlatButton(
                      onPressed: () => Navigator.pushNamed(context, "/video"),
                      child: Text("Local Video"),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Icon(Icons.video_collection_rounded),
                    FlatButton(
                      onPressed: () => Navigator.pushNamed(context, "urlVideo"),
                      child: Text("URL Video"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
