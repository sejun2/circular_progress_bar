import 'package:circular_progress_bar/circular_progress_bar_painter.dart';
import 'package:flutter/material.dart';

class CircularProgressBar extends StatefulWidget {
  /**
   * ### width and height must bigger than radius * 2. ###
   */
  CircularProgressBar({
    Key? key,
    required this.width,
    required this.height,
    this.percentageVisibility = true,
    this.duration = const Duration(milliseconds: 700),
    this.curve = Curves.linear,
    required this.radius,
    required this.percentage,
    required this.color,
  }) : super(key: key);

  final double radius;
  final double percentage;
  final Color color;
  final Duration duration;
  final Curve curve;
  final bool percentageVisibility;
  final double width;
  final double height;

  @override
  State<StatefulWidget> createState() {
    return _CircularProgressBarState();
  }
}

class _CircularProgressBarState extends State<CircularProgressBar>
    with SingleTickerProviderStateMixin {
  _CircularProgressBarState();

  late Animation _animation;
  late AnimationController _animationController;

  void _initAnimationResources() {
    _animationController = AnimationController.unbounded(
        vsync: this, duration: widget.duration, value: 0.0 //초기값
        );

    _animation = _animationController.drive(CurveTween(curve: widget.curve));
  }

  @override
  void initState() {
    _initAnimationResources();
    super.initState();
  }

  void forward() {
    _animationController.animateTo(widget.percentage);
  }

  void backward() {
    _animationController.animateBack(widget.percentage);
  }

  @override
  Widget build(BuildContext context) {
    forward();

    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(children: [
            Container(
              width: widget.width,
              height: widget.height,
              color: Colors.amberAccent,
              child: CustomPaint(
                painter: CircularProgressBarPainter(
                    strokeWidth: 16,
                    radius: widget.radius,
                    color: widget.color,
                    percentage: _animationController.value),
              ),
            ),
            widget.percentageVisibility == true
                ? Text(
                    widget.percentage.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white),
                  )
                : const SizedBox(),
          ]);
        });
  }
}
