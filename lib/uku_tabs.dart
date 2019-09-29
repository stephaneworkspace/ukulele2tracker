import 'dart:ui';

import 'package:flutter/material.dart';

// https://stackoverflow.com/questions/54661354/draw-lines-with-flutter
// https://stackoverflow.com/questions/45684367/flutter-drawing-a-rectangle-in-bottom
class UkuTabs extends CustomPainter {

  var _swPrint = false;

  UkuTabs(bool swPrint) {
    _swPrint = swPrint;
  }

  @override
  void paint(Canvas canvas, Size size) {

    // x | | | | x // = 5 { x = margin}
    final pXDiv6 = size.width / 5; // 4 chord + margin
    final pXDiv2 = size.width / 2; // for print round helper black
    final pYBegin = 0.0;
    final pYEnd = size.height;
    final strokeWidth = 4.0; // Grid black
    final strokeLigne0Width = 3.0; // Round withe
    final pYBeginLigne0 = pYBegin + ((strokeWidth * 3) / 2); // Round withe
    final pYBeginLigne1 = pYBegin + (strokeWidth * 3);
    final espacementY = 40.0;
    final strokeHelperWidth = 1.0; // round helper black
    final circleHelperRadius = 13.0; // round helper black

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
      Offset(pXDiv6 * 1, pYBeginLigne1 + (espacementY * 1)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (espacementY * 1)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (espacementY * 2)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (espacementY * 2)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (espacementY * 3)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (espacementY * 3)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (espacementY * 4)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (espacementY * 4)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (espacementY * 5)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (espacementY * 5)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (espacementY * 6)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (espacementY * 6)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (espacementY * 7)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (espacementY * 7)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (espacementY * 8)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (espacementY * 8)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (espacementY * 9)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (espacementY * 9)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (espacementY * 10)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (espacementY * 10)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (espacementY * 11)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (espacementY * 11)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (espacementY * 12)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (espacementY * 12)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (espacementY * 13)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (espacementY * 13)),
    ];
    paint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;
    canvas.drawPoints(PointMode.lines, points, paint);
    
    paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeHelperWidth
      ..strokeCap = StrokeCap.round;
    // Circle
    canvas.drawCircle(Offset(pXDiv2, (pYBeginLigne1 + (espacementY * 5) + espacementY / 2)), circleHelperRadius, paint);
    canvas.drawCircle(Offset(pXDiv2, (pYBeginLigne1 + (espacementY * 7) + espacementY / 2)), circleHelperRadius, paint);
    canvas.drawCircle(Offset(pXDiv2, (pYBeginLigne1 + (espacementY * 10) + espacementY / 2)), circleHelperRadius, paint);
    canvas.drawCircle(Offset(pXDiv2, (pYBeginLigne1 + (espacementY * 12) + espacementY / 2)), circleHelperRadius, paint);

    // Essai
    if (_swPrint) {
      // 0.1
      paint = Paint()
        ..color = Colors.black
        ..strokeWidth = strokeHelperWidth
        ..strokeCap = StrokeCap.round;
      canvas.drawCircle(Offset(pXDiv6 * 1, pYBeginLigne0), circleHelperRadius, paint);  
      paint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeLigne0Width
        ..strokeCap = StrokeCap.round;
      canvas.drawCircle(Offset(pXDiv6 * 1, pYBeginLigne0), circleHelperRadius, paint);
      paint = Paint()
        ..color = Colors.black
        ..strokeWidth = strokeHelperWidth
        ..strokeCap = StrokeCap.round;
      // 1.1
      // canvas.drawCircle(Offset(pXDiv6 * 1, (pYBeginLigne0 + (espacementY * 0) + espacementY / 2)), circleHelperRadius, paint);
    }
  }

  @override
  bool shouldRepaint(UkuTabs oldDelegate) {
    return false;
  }
}