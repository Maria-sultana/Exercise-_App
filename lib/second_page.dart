import 'dart:ui';

import 'package:my_api/model.dart';

import 'package:flutter/material.dart';
import 'package:my_api/third_page.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key, this.exercise}) : super(key: key);

  final Exercise? exercise;
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int second = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "${widget.exercise!.thumbnail}",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SleekCircularSlider(
                  min: 3,
                  max: 10,
                  initialValue: second.toDouble(),
                  onChange: (double value) {
                    setState(() {
                      second = value.toInt();
                      print("second issss$second");
                    });
                    // callback providing a value while its being changed (with a pan gesture)
                  },
                  innerWidget: (double value) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("${second.toStringAsFixed(0)}",
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold)),
                          ElevatedButton(
                            onPressed: () {
                              print("sssssssssssssss$second");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ThirdPage(
                                        exercise: widget.exercise,
                                        second: second ,
                                      )));
                            },
                            child: Text("Start"),
                            style: ElevatedButton.styleFrom(
                               primary: Colors.yellow,
                          )
                      )],
                      ),
                    );
                    // use your custom widget inside the slider (gets a slider value from the callback)
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
