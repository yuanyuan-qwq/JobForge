import 'package:flutter/material.dart';
import 'package:jobstreet/Login_Page/screen/first_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:jobstreet/main_Controller.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen>{

  //video controller
  late VideoPlayerController _controller;

  void initState(){
    super.initState();

    _controller = VideoPlayerController.asset(
        "images/Job.mp4",
    )
      ..initialize().then((_) {
        setState(() {});
      })..setVolume(0.0);

    _playVideo();
  }

  void _playVideo() async{
    //play video
    _controller.play();

    //add delay till video is complete
    await Future.delayed(const Duration(seconds: 3));
    
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => firstPage() ),
    );
  }

  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      backgroundColor: Color.fromRGBO(0, 84, 246, 1),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(
                  _controller,
                ),
           )
            : Container(),

      ),
    );
  }
  
  
  
}