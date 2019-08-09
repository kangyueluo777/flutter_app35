import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget{
  VideoPlayerScreen({Key key}):super(key:key);

  @override
  _VideoPlayerScreenState createState()=> _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>{
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState(){
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Butterfly Video'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              if(_controller.value.isPlaying){
                _controller.pause();
              }else{
                _controller.play();
              }
            });
          },

        child: Icon(
          _controller.value.isPlaying?Icons.pause:Icons.play_arrow,
        ),
      ),
    );
  }

}

