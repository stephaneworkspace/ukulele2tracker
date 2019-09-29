import 'dart:ui';

import 'package:flutter/material.dart';

// https://stackoverflow.com/questions/54661354/draw-lines-with-flutter
// https://stackoverflow.com/questions/45684367/flutter-drawing-a-rectangle-in-bottom
class UkuTabs extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

/*
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      new Paint()..color = new Color(0xFF0099FF),
    );*/

  // x | | | | x // = 5 { x = margin}
  final pXDiv6 = size.width / 5;
  final pYBegin = 50.0;
  final pYEnd = size.height; // je fais ça après

  final points = [
    Offset(pXDiv6 * 1, pYBegin),
    Offset(pXDiv6 * 1, pYEnd),
    Offset(pXDiv6 * 2, pYBegin),
    Offset(pXDiv6 * 2, pYEnd),
    Offset(pXDiv6 * 3, pYBegin),
    Offset(pXDiv6 * 3, pYEnd),
    Offset(pXDiv6 * 4, pYBegin),
    Offset(pXDiv6 * 4, pYEnd),
  ];
/*
  final points = [
    Offset(0, 100),
    Offset(150, 75),
    Offset(250, 250),
    Offset(130, 200),
    Offset(270, 100),
  ];*/
  final paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round;
  canvas.drawPoints(PointMode.lines, points, paint);


    /*

    var path = Path();
    path.moveTo(size.width / 3, size.height * 3 / 4);
    path.lineTo(size.width / 2, size.height * 5 / 6);
    path.lineTo(size.width * 3 / 4, size.height * 4 / 6);
    path.close();

    paint.style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
    */
    /*
    canvas.drawRect(
      new Rect.fromLTRB(
        0.0, 0.0, 5.0, 300.0
      ),
      new Paint()..color = new Color(0xFF0099FF),
    );*/

  }

  @override
  bool shouldRepaint(UkuTabs oldDelegate) {
    return false;
  }
}