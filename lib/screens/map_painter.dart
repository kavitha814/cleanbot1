// widgets/map_painter.dart
import 'package:flutter/material.dart';

class MapPainter extends CustomPainter {
  final bool isCleaning;

  MapPainter({required this.isCleaning});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final fillPaint = Paint()
      ..color = Colors.blue[100]!.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    // Draw room outline
    final roomPath = Path()
      ..moveTo(40, 40)
      ..lineTo(160, 40)
      ..lineTo(160, 160)
      ..lineTo(40, 160)
      ..close();

    canvas.drawPath(roomPath, fillPaint);
    canvas.drawPath(roomPath, paint);

    // Draw cleaning path if cleaning
    if (isCleaning) {
      final pathPaint = Paint()
        ..color = Colors.green
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;

      final cleanPath = Path()
        ..moveTo(50, 50)
        ..lineTo(150, 50)
        ..lineTo(150, 80)
        ..lineTo(50, 80)
        ..lineTo(50, 110)
        ..lineTo(150, 110);

      canvas.drawPath(cleanPath, pathPaint);
    }

    // Draw bot position
    final botPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawCircle(const Offset(100, 80), 8, botPaint);

    // Draw bot direction indicator
    final directionPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final directionPath = Path()
      ..moveTo(100, 75)
      ..lineTo(105, 80)
      ..lineTo(100, 85)
      ..close();

    canvas.drawPath(directionPath, directionPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}