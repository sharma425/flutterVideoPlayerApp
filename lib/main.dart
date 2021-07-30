import 'package:Video_app/urlVideo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'audio.dart';
import 'urlAudio.dart';
import 'video.dart';
import 'urlVideo.dart';
import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => MyHome(),
      "/audio": (context) => Audio_Play(),
      "/video": (context) => Video(),
      "/urlAudio": (context) => UrlAudio(),
      "urlVideo": (context) => UrlVideo(),
    },
  ));
}
