import 'dart:math';
import 'package:flutter/material.dart';

class CircularProgressBarPainter extends CustomPainter {
  final double radius;
  final Color color;
  final double percentage; //progress 진척도

  CircularProgressBarPainter(
      {required this.radius, required this.color, required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    print('Size :: width : ${size.width} height : ${size.height}');

    assert(radius <= size.width / 2 && radius <= size.height / 2);

    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Path greyCirclePath = Path();
    Path coloredCirclePath = Path();

    //setGreyCirclePaint
    Paint greyCirclePaint = Paint();
    greyCirclePaint.color = Colors.grey;
    greyCirclePaint.style = PaintingStyle.stroke;
    greyCirclePaint.strokeCap = StrokeCap.round;
    greyCirclePaint.strokeWidth = 25;

    //setColoredCirclePaint
    Paint coloredCirclePaint = Paint();
    coloredCirclePaint.strokeWidth = 25;
    coloredCirclePaint.color = color;
    coloredCirclePaint.style = PaintingStyle.stroke;
    coloredCirclePaint.strokeCap = StrokeCap.round;

    //draw greyCirclePath
    greyCirclePath.addArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        0,
        percentageToRadian(100.0));

    //draw coloredCirclePath
    coloredCirclePath.addArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        0,
        percentageToRadian(percentage));

    canvas.drawPath(greyCirclePath, greyCirclePaint);
    canvas.drawPath(coloredCirclePath, coloredCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadian(double degree) {
    return degree * pi / 180;
  }

  double percentageToRadian(double percentage) {
    return percentage * pi / 100 * 2;
  }

  double radianToPercentage(double radian) {
    return radian / pi * 100;
  }
}
