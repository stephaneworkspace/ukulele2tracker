import 'dart:ui';

import 'package:flutter/material.dart';

// https://stackoverflow.com/questions/54661354/draw-lines-with-flutter
// https://stackoverflow.com/questions/45684367/flutter-drawing-a-rectangle-in-bottom
class UkuTabs extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

  // x | | | | x // = 5 { x = margin}
  final pXDiv6 = size.width / 5;
  final pYBegin = 0.0;
  final pYEnd = size.height;
  final strokeWidth = 4.0;
  final pYBeginLigne0 = pYBegin + (strokeWidth * 3);
  final espacementY = 40.0;

  var points = [
    Offset(pXDiv6 * 1, pYBegin),
    Offset(pXDiv6 * 1, pYEnd),
    Offset(pXDiv6 * 2, pYBegin),
    Offset(pXDiv6 * 2, pYEnd),
    Offset(pXDiv6 * 3, pYBegin),
    Offset(pXDiv6 * 3, pYEnd),
    Offset(pXDiv6 * 4, pYBegin),
    Offset(pXDiv6 * 4, pYEnd),
  ];
  var paint = Paint()
    ..color = Colors.black
    ..strokeWidth = strokeWidth
    ..strokeCap = StrokeCap.round;
  canvas.drawPoints(PointMode.lines, points, paint);

  points = [
    // Bar 3 * 4px = 12py
    Offset(pXDiv6 * 1, pYBegin),
    Offset(pXDiv6 * 4, pYBegin),    
    Offset(pXDiv6 * 1, pYBegin + (strokeWidth)),
    Offset(pXDiv6 * 4, pYBegin + (strokeWidth)),    
    Offset(pXDiv6 * 1, pYBegin + (strokeWidth * 2)),
    Offset(pXDiv6 * 4, pYBegin + (strokeWidth * 2)),
    Offset(pXDiv6 * 1, pYBegin + (strokeWidth * 3)),
    Offset(pXDiv6 * 4, pYBegin + (strokeWidth * 3)),
    // Bar
    Offset(pXDiv6 * 1, pYBeginLigne0 + (espacementY * 1)),
    Offset(pXDiv6 * 4, pYBeginLigne0 + (espacementY * 1)),
    Offset(pXDiv6 * 1, pYBeginLigne0 + (espacementY * 2)),
    Offset(pXDiv6 * 4, pYBeginLigne0 + (espacementY * 2)),
    Offset(pXDiv6 * 1, pYBeginLigne0 + (espacementY * 3)),
    Offset(pXDiv6 * 4, pYBeginLigne0 + (espacementY * 3)),
    Offset(pXDiv6 * 1, pYBeginLigne0 + (espacementY * 4)),
    Offset(pXDiv6 * 4, pYBeginLigne0 + (espacementY * 4)),
    Offset(pXDiv6 * 1, pYBeginLigne0 + (espacementY * 5)),
    Offset(pXDiv6 * 4, pYBeginLigne0 + (espacementY * 5)),
    Offset(pXDiv6 * 1, pYBeginLigne0 + (espacementY * 6)),
    Offset(pXDiv6 * 4, pYBeginLigne0 + (espacementY * 6)),
    Offset(pXDiv6 * 1, pYBeginLigne0 + (espacementY * 7)),
    Offset(pXDiv6 * 4, pYBeginLigne0 + (espacementY * 7)),
    Offset(pXDiv6 * 1, pYBeginLigne0 + (espacementY * 8)),
    Offset(pXDiv6 * 4, pYBeginLigne0 + (espacementY * 8)),
    Offset(pXDiv6 * 1, pYBeginLigne0 + (espacementY * 9)),
    Offset(pXDiv6 * 4, pYBeginLigne0 + (espacementY * 9)),
    Offset(pXDiv6 * 1, pYBeginLigne0 + (espacementY * 10)),
    Offset(pXDiv6 * 4, pYBeginLigne0 + (espacementY * 10)),
    Offset(pXDiv6 * 1, pYBeginLigne0 + (espacementY * 11)),
    Offset(pXDiv6 * 4, pYBeginLigne0 + (espacementY * 11)),
    Offset(pXDiv6 * 1, pYBeginLigne0 + (espacementY * 12)),
    Offset(pXDiv6 * 4, pYBeginLigne0 + (espacementY * 12)),
    Offset(pXDiv6 * 1, pYBeginLigne0 + (espacementY * 13)),
    Offset(pXDiv6 * 4, pYBeginLigne0 + (espacementY * 13)),
  ];
  paint = Paint()
    ..color = Colors.black
    ..strokeWidth = strokeWidth
    ..strokeCap = StrokeCap.square;
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