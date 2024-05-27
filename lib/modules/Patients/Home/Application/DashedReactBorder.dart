import 'package:flutter/material.dart';
import 'dart:math';

class DashedRectBorder extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double gapWidth;
  final double dashWidth;
  final BorderRadius borderRadius;
  final Widget child;

  const DashedRectBorder({
    required this.child,
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.gapWidth = 3.0,
    this.dashWidth = 5.0,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedRectPainter(
        color: color,
        strokeWidth: strokeWidth,
        gapWidth: gapWidth,
        dashWidth: dashWidth,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}

class _DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gapWidth;
  final double dashWidth;
  final BorderRadius borderRadius;

  _DashedRectPainter({
    required this.color,
    required this.strokeWidth,
    required this.gapWidth,
    required this.dashWidth,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Create rounded rectangle
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final RRect rRect = RRect.fromRectAndCorners(rect,
        topLeft: borderRadius.topLeft,
        topRight: borderRadius.topRight,
        bottomLeft: borderRadius.bottomLeft,
        bottomRight: borderRadius.bottomRight);

    // Top side
    double startX = rRect.left;
    while (startX < rRect.right) {
      double endX = min(startX + dashWidth, rRect.right);
      canvas.drawLine(
          Offset(startX, rRect.top), Offset(endX, rRect.top), paint);
      startX += dashWidth + gapWidth;
    }

    // Right side
    double startY = rRect.top;
    while (startY < rRect.bottom) {
      double endY = min(startY + dashWidth, rRect.bottom);
      canvas.drawLine(
          Offset(rRect.right, startY), Offset(rRect.right, endY), paint);
      startY += dashWidth + gapWidth;
    }

    // Bottom side
    double endX = rRect.right;
    while (endX > rRect.left) {
      double startX = max(endX - dashWidth, rRect.left);
      canvas.drawLine(
          Offset(startX, rRect.bottom), Offset(endX, rRect.bottom), paint);
      endX -= dashWidth + gapWidth;
    }

    // Left side
    double endY = rRect.bottom;
    while (endY > rRect.top) {
      double startY = max(endY - dashWidth, rRect.top);
      canvas.drawLine(
          Offset(rRect.left, startY), Offset(rRect.left, endY), paint);
      endY -= dashWidth + gapWidth;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
