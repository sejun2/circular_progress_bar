import 'dart:math';

import 'package:flutter/material.dart';
import 'package:circular_progress_bar/circular_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  double _percentage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressBar(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 50),
              width: 1000,
              height: 300,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.elasticInOut,
              radius: 100,
              percentage: _percentage,
              color: Colors.amber,
              percentagePrefix: " PREFIX",
              percentageSuffix: "SUFFIX ",
            ),
            TextButton(
                onPressed: () {
                  Random random = Random();
                  var randomNumber = random.nextInt(100);
                  setState(() {
                    _percentage = randomNumber.toDouble();
                  });
                },
                child: const Text('craete random number 0 ~ 100')),
          ],
        ),
      ),
    );
  }
}
