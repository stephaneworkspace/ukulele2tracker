import 'package:flutter/material.dart';

// https://stackoverflow.com/questions/54661354/draw-lines-with-flutter
// https://stackoverflow.com/questions/45684367/flutter-drawing-a-rectangle-in-bottom
class UkuTabs extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      new Paint()..color = new Color(0xFF0099FF),
    );
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