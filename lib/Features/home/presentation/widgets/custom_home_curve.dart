import 'package:flutter/material.dart';

class CustomCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 15;

    Path path = Path();

    path.moveTo(0, size.height * .15);
    path.quadraticBezierTo(
        size.width / 4, size.height * .3, size.width / 2, size.height * .15);
    path.quadraticBezierTo(
        size.width * 3 / 4, 0, size.width, size.height * .15);

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
    var rect = Offset.zero & size;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
