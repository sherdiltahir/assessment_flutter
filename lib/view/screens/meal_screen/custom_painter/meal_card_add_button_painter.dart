import 'package:flutter/material.dart';

class StrokeToAddButton extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade100
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;
    canvas.drawLine(const Offset(0, 0), Offset(0, size.height), paint);
    canvas.drawLine(
        Offset(0, size.height), Offset(size.width, size.height), paint);
    const radius = 5.0; // radius of the curve
    Rect rect = Rect.fromCircle(center: Offset(0, size.height), radius: radius);
    canvas.drawArc(rect, 0, 10, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
