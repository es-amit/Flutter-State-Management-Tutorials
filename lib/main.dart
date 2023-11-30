import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/count_provider.dart';
//import 'package:state_management/provider/count_provider.dart';
import 'package:state_management/provider/exampleoneProvider.dart';
import 'package:state_management/provider/favourite_provider.dart';
//import 'package:state_management/lecture1.dart';
//import 'package:state_management/lecture2.dart';
//import 'package:state_management/lecture3.dart';
//import 'package:state_management/screen/count_example.dart';
//import 'package:state_management/screen/exampleone.dart';
import 'package:state_management/screen/favourite/favourite_scree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=> ExampleOneProvider()),
        ChangeNotifierProvider(
          create: (_)=> CountProvider()),
        ChangeNotifierProvider(
          create: (_)=> FavouriteItemProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: FavouriteScreen(),
      ),
    );
  }
}
