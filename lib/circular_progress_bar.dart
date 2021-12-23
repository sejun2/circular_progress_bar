import 'package:circular_progress_bar/circular_progress_bar_painter.dart';
import 'package:flutter/material.dart';

class CircularProgressBar extends StatefulWidget {
  const CircularProgressBar({
    Key? key,
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
          return CustomPaint(
            painter: CircularProgressBarPainter(
                radius: widget.radius,
                color: widget.color,
                percentage: _animationController.value),
          );
        });
  }
}
