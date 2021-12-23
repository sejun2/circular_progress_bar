import 'package:flutter/material.dart';
import 'package:circular_progress_bar/circular_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Container(
                color: Colors.blue,
                width: 300,
                height: 500,
                child: const CircularProgressBar(
                  radius: 30,
                  percentage: 30,
                  color: Colors.amber,
                ))),
      ),
    );
  }
}
