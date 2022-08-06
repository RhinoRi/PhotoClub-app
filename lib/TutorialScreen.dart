import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'ChewieListitems.dart';

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorials '),
      ),
      body: ListView(
        children: <Widget>[
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'assets/video_tutorials/video1.mp4',
            ),
            looping: true,
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'assets/video_tutorials/video2.mp4',
            ),
            looping: true,
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'assets/video_tutorials/video3.mp4',
            ),
            looping: true,
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'assets/video_tutorials/video4.mp4',
            ),
            looping: true,
          ),
        ],
      ),
    );
  }
}
