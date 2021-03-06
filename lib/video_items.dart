import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItems extends StatefulWidget
{

  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;


  VideoItems({@required this.videoPlayerController, this.looping, this.autoplay, Key key,}) : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();

}

class _VideoItemsState extends State<VideoItems>
{
  ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chewieController = ChewieController(videoPlayerController: widget.videoPlayerController,aspectRatio: 5/8, autoInitialize: true, autoPlay: widget.autoplay, looping: widget.looping,
         errorBuilder: (context, errorMessage){
           return Center(
             child: Text(errorMessage,style: TextStyle(color: Colors.white),),
           );
         });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  
}