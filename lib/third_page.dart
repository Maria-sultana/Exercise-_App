import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_api/home_page.dart';
import 'package:my_api/model.dart';

import 'package:flutter/material.dart';
import 'package:my_api/widget.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key? key, this.exercise, this.second}) : super(key: key);

  final Exercise? exercise;
  int? second;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  
  bool isPlaying = false;
  bool isComplete = false;
  int startSound = 0;
  late Timer timer;
  String musicPath = "assets/music.mp3";

  playAudio() async {
    
  }

  @override
  void initState() {
   
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      

      if (timer.tick == widget.second) {
        timer.cancel();
        setState(() {
         
          playAudio();
          showToast("Nailed it");
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pop();
          });
        });
      }
      setState(() {
        startSound = timer.tick;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            width: double.infinity,
            imageUrl: "${widget.exercise!.gif}",
            fit: BoxFit.cover,
            placeholder: (context, url) => spinkit,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Center(child: Text("$startSound")))
        ],
      ),
    );
  }
}
