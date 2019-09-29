import 'dart:ui';

import 'package:flutter/material.dart';

// https://stackoverflow.com/questions/54661354/draw-lines-with-flutter
// https://stackoverflow.com/questions/45684367/flutter-drawing-a-rectangle-in-bottom
class UkuTabs extends CustomPainter {

  var _swPrint = false;
  final _espacementY = 40.0;
  final _circleRadius = 13.0;

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
      Offset(pXDiv6 * 1, pYBeginLigne1 + (_espacementY * 1)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (_espacementY * 1)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (_espacementY * 2)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (_espacementY * 2)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (_espacementY * 3)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (_espacementY * 3)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (_espacementY * 4)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (_espacementY * 4)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (_espacementY * 5)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (_espacementY * 5)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (_espacementY * 6)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (_espacementY * 6)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (_espacementY * 7)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (_espacementY * 7)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (_espacementY * 8)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (_espacementY * 8)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (_espacementY * 9)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (_espacementY * 9)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (_espacementY * 10)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (_espacementY * 10)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (_espacementY * 11)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (_espacementY * 11)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (_espacementY * 12)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (_espacementY * 12)),
      Offset(pXDiv6 * 1, pYBeginLigne1 + (_espacementY * 13)),
      Offset(pXDiv6 * 4, pYBeginLigne1 + (_espacementY * 13)),
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
    canvas.drawCircle(Offset(pXDiv2, (pYBeginLigne1 + (_espacementY * 5) + _espacementY / 2)), circleHelperRadius, paint);
    canvas.drawCircle(Offset(pXDiv2, (pYBeginLigne1 + (_espacementY * 7) + _espacementY / 2)), circleHelperRadius, paint);
    canvas.drawCircle(Offset(pXDiv2, (pYBeginLigne1 + (_espacementY * 10) + _espacementY / 2)), circleHelperRadius, paint);
    canvas.drawCircle(Offset(pXDiv2, (pYBeginLigne1 + (_espacementY * 12) + _espacementY / 2)), circleHelperRadius, paint);

    // Essai
    if (_swPrint) {
      // 0.1
      paint = Paint()
        ..color = Colors.black;
      canvas.drawCircle(printCircle(0, 1, pXDiv6), _circleRadius, paint);
      paint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeLigne0Width
        ..strokeCap = StrokeCap.round;
      canvas.drawCircle(printCircle(0, 1, pXDiv6), _circleRadius, paint);
      // 2.2
      paint = Paint()
        ..color = Colors.black;
      canvas.drawCircle(printCircle(2, 2, pXDiv6), _circleRadius, paint);
      // 1.3
      paint = Paint()
        ..color = Colors.black;
      canvas.drawCircle(printCircle(1, 3, pXDiv6), _circleRadius, paint);
      // 2.4
      paint = Paint()
        ..color = Colors.black;
      canvas.drawCircle(printCircle(2, 4, pXDiv6), _circleRadius, paint);
    }
  }

  @override
  bool shouldRepaint(UkuTabs oldDelegate) {
    return false;
  }

  /// y = ligne 0 -> 13
  /// x = 1, 2, 3, 4
  /// pXDiv6 = 4 chord + margin (see upper in paint method)
  Offset printCircle(int y, int x, double pXDiv6, ) {
    final strokeWidth = 4.0;
    final pYBegin = 0.0;
    final pYBeginLigne0 = pYBegin + ((strokeWidth * 3) / 2); // Round withe / black
    final pYBeginLigne1 = pYBegin + (strokeWidth * 3); // Round black
    switch(y) {
      case 0:
        return Offset(pXDiv6 * x.toDouble(), pYBeginLigne0);
      default:
        return Offset(pXDiv6 * x.toDouble(), (pYBeginLigne1 + (_espacementY * (y.toDouble() - 1.0)) + _espacementY / 2.0));
    }
  }
}