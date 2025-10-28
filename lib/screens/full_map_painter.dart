// widgets/full_map_painter.dart
import 'package:flutter/material.dart';

class FullMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw multiple rooms with different cleaning status
    final rooms = [
      {
        'rect': const Rect.fromLTWH(20, 20, 120, 100),
        'name': 'Living Room',
        'cleaned': true
      },
      {
        'rect': const Rect.fromLTWH(20, 130, 80, 80),
        'name': 'Kitchen',
        'cleaned': true
      },
      {
        'rect': const Rect.fromLTWH(150, 20, 130, 90),
        'name': 'Dining Room',
        'cleaned': false
      },
      {
        'rect': const Rect.fromLTWH(110, 130, 90, 130),
        'name': 'Bedroom',
        'cleaned': false
      },
      {
        'rect': const Rect.fromLTWH(210, 120, 70, 100),
        'name': 'Balcony',
        'cleaned': false
      },
    ];

    for (var room in rooms) {
      final rect = room['rect'] as Rect;
      final cleaned = room['cleaned'] as bool;
      final name = room['name'] as String;

      // Fill paint based on cleaning status
      final fillPaint = Paint()
        ..color = cleaned
            ? Colors.blue[100]!.withOpacity(0.5)
            : Colors.grey[300]!
        ..style = PaintingStyle.fill;

      // Stroke paint for room outline
      final strokePaint = Paint()
        ..color = Colors.grey[800]!
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      canvas.drawRect(rect, fillPaint);
      canvas.drawRect(rect, strokePaint);

      // Draw room label
      final textPainter = TextPainter(
        text: TextSpan(
          text: name,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          rect.left + (rect.width - textPainter.width) / 2,
          rect.top + (rect.height - textPainter.height) / 2,
        ),
      );
    }

    // Draw cleaning path in cleaned rooms
    final pathPaint = Paint()
      ..color = Colors.green.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Living room cleaning path
    final livingRoomPath = Path()
      ..moveTo(30, 30)
      ..lineTo(130, 30)
      ..lineTo(130, 50)
      ..lineTo(30, 50)
      ..lineTo(30, 70)
      ..lineTo(130, 70)
      ..lineTo(130, 90)
      ..lineTo(30, 90)
      ..lineTo(30, 110);

    canvas.drawPath(livingRoomPath, pathPaint);

    // Kitchen cleaning path
    final kitchenPath = Path()
      ..moveTo(30, 140)
      ..lineTo(90, 140)
      ..lineTo(90, 160)
      ..lineTo(30, 160)
      ..lineTo(30, 180)
      ..lineTo(90, 180);

    canvas.drawPath(kitchenPath, pathPaint);

    // Draw bot position
    final botPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final botShadowPaint = Paint()
      ..color = Colors.red.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    // Bot shadow
    canvas.drawCircle(const Offset(82, 152), 12, botShadowPaint);
    // Bot
    canvas.drawCircle(const Offset(80, 150), 10, botPaint);

    // Draw bot direction indicator
    final directionPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final directionPath = Path()
      ..moveTo(80, 145)
      ..lineTo(85, 150)
      ..lineTo(80, 155)
      ..close();

    canvas.drawPath(directionPath, directionPaint);

    // Draw detected objects
    final objectPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    // Keys in hallway
    canvas.drawCircle(const Offset(145, 125), 5, objectPaint);
    
    // Earbuds in bedroom
    canvas.drawCircle(const Offset(155, 180), 5, objectPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}