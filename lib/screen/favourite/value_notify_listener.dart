import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});


  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider tutorial"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: toggle,
            builder: (context,value,child) {
              return TextFormField(
                obscureText: toggle.value,
                decoration:  InputDecoration(
                  hintText: "Password",
                  suffix: IconButton(
                    onPressed: (){
                      toggle.value = !toggle.value;
                    }, 
                    icon: toggle.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility))
                ),
              );
            }
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter, 
              builder: (context,value,child){
                return  Text(_counter.value.toString(),
                  style: const TextStyle(
                    fontSize: 50
                  ),);
              })
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _counter.value++;
          print(_counter.value.toString());
      },
      child: const Icon(Icons.add),),
    );
  }
}