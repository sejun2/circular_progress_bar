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

  late AnimationController _animationController;

  late Animation _animation;

  double _currentPercentage = 0.0;

  void _initAnimationResources() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        lowerBound: 0.0,
        upperBound: 100.0
    );

    _animation = _animationController.drive(
        CurveTween(curve: Curves.linear)
    );
    _animationController.addStatusListener((status) {
      switch(status){
        case AnimationStatus.completed : _currentPercentage = _animationController.value;
      }
    });
  }

  @override
  void initState() {
    _initAnimationResources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Column(
              children: [
                Container(
                    color: Colors.blue,
                    width: 300,
                    height: 500,
                    child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, widget) {
                          return CircularProgressBar(
                            radius: 30,
                            percentage: _animationController.value,
                            color: Colors.amber,
                          );
                        }
                    )),
                TextButton(onPressed: () {
                  _animationController.forward(from: _currentPercentage);
                }, child: Text('run foo'))
              ],
            )),
      ),
    );
  }
}
