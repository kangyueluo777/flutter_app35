import 'package:flutter/material.dart';

import 'VideoPlayerScreen.dart';

void main() => runApp(VideoPlayerApp());

class VideoPlayerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',

      home: VideoPlayerScreen(),
    );
  }
}

