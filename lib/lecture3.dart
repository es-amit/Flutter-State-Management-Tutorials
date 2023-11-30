import 'dart:async';

import 'package:flutter/material.dart';

class Lecture3 extends StatefulWidget {
  const Lecture3({super.key});

  @override
  State<Lecture3> createState() => _Lecture3State();
}

class _Lecture3State extends State<Lecture3> {
  int count =0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      // setState(() {
        
      // });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider state Management"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}"  ,
            style: const TextStyle(
              fontSize: 50
            ),),
          ),
          Center(
            child: Text(count.toString(),
            style: const TextStyle(
              fontSize: 50
            ),),
          )
        ],
      ),
    );
  }
}