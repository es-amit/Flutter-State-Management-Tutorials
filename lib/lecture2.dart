import 'package:flutter/material.dart';

class Lecture2 extends StatefulWidget {
  const Lecture2({super.key});

  @override
  State<Lecture2> createState() => _Lecture2State();
}

class _Lecture2State extends State<Lecture2> {

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("StateFull widget"),
        centerTitle: true,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(count.toString(),
            style: const TextStyle(
              fontSize: 50
            ),),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          count++;
          setState(() {
            
          });
        },
        child: const Icon(Icons.add),),
    );
  }
}