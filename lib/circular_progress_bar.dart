import 'package:circular_progress_bar/circular_progress_bar_painter.dart';
import 'package:flutter/material.dart';

//TODO('Satoshi') : percentage text에 소수점 표시될지 여부
//TODO('Satoshi') : percentage text 커스터마이징

class CircularProgressBar extends StatefulWidget {
  /**
   * ### width and height must bigger than radius * 2. ###
   */
  const CircularProgressBar({
    Key? key,
    required this.width,
    required this.height,
    this.textStyle = const TextStyle(
        color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
    this.percentageVisibility = true,
    this.duration = const Duration(milliseconds: 700),
    this.strokeCap = StrokeCap.round,
    this.strokeWidth = 20,
    this.curve = Curves.linear,
    required this.radius,
    required this.percentage,
    required this.color,
    this.percentagePrefix = '',
    this.percentageSuffix = '',
  }) : super(key: key);

  final double radius;
  final double percentage;
  final Color color;
  final Duration duration;
  final Curve curve;
  final bool percentageVisibility;
  final double width;
  final double height;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final TextStyle textStyle;
  final String percentagePrefix;
  final String percentageSuffix;

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
          return Container(
            color: Colors.red,
            width: widget.width,
            height: widget.height,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CustomPaint(
                    painter: CircularProgressBarPainter(
                        strokeCap: widget.strokeCap,
                        strokeWidth: widget.strokeWidth,
                        radius: widget.radius,
                        color: widget.color,
                        percentage: _animationController.value),
                  ),
                ),
                widget.percentageVisibility
                    ? Positioned.fill(
                        child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${widget.percentagePrefix}${widget.percentage.toString()}${widget.percentageSuffix}',
                          style: widget.textStyle,
                        ),
                      ))
                    : const SizedBox()
              ],
            ),
          );
        });
  }
}
