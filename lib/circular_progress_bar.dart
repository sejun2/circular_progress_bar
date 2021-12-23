import 'package:circular_progress_bar/circular_progress_bar_painter.dart';
import 'package:flutter/material.dart';

class CircularProgressBar extends StatefulWidget {
  const CircularProgressBar(
      {Key? key,
      required this.radius,
      required this.percentage,
      required this.color})
      : super(key: key);

  final double radius;
  final double percentage;
  final Color color;

  @override
  State<StatefulWidget> createState() {
    return _CircularProgressBarState();
  }
}

class _CircularProgressBarState extends State<CircularProgressBar>
    with SingleTickerProviderStateMixin {
  _CircularProgressBarState();

  late AnimationController progressAnimationController;
  late Animation progressAnimation;

  initAnimationResources() {}

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircularProgressBarPainter(
          radius: widget.radius,
          color: widget.color,
          percentage: widget.percentage),
    );
  }
}
