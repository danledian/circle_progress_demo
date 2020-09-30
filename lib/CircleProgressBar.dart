import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleProgressBar extends StatefulWidget{

  final double width;

  final double strokeWidth;

  final Color topBackgroundColor;

  final Color leftBackgroundColor;

  final Color rightBackgroundColor;

  final Color topProgressColor;

  final Color leftProgressColor;

  final Color rightProgressColor;

  final int topProgress;

  final int leftProgress;

  final int rightProgress;

  const CircleProgressBar({
    Key key,
    this.width = 270,
    this.strokeWidth = 30.0,
    this.topBackgroundColor = Colors.purpleAccent,
    this.leftBackgroundColor = Colors.purple,
    this.rightBackgroundColor = Colors.deepPurpleAccent,
    this.topProgressColor = Colors.deepPurple,
    this.leftProgressColor = Colors.orangeAccent,
    this.rightProgressColor = Colors.orange,
    this.topProgress = 0,
    this.leftProgress = 0,
    this.rightProgress = 0,
  }): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CircleProgressBarState();
  }

}

class CircleProgressBarState extends State<CircleProgressBar>{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 100.0,
      height: widget.width ?? 100.0,
      // color: Colors.orange,
      child: CustomPaint(
        painter: CircleProgressBarPainter(widget),
      ),
    );
  }

}

class CircleProgressBarPainter extends CustomPainter{

  final CircleProgressBar widget;

  CircleProgressBarPainter(this.widget);

  @override
  void paint(Canvas canvas, Size size) {

    double centerX = size.width/2;
    double centerY = size.height/2;
    double r2 = size.width - widget.strokeWidth;

    var paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = widget.strokeWidth
        ..color = widget.topBackgroundColor;

    canvas.drawArc(Rect.fromCenter(center: Offset(centerY, centerY), width: r2, height: r2), 0.0, 2 * pi/3, false, paint);



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate)  => true;


}