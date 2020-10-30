import 'dart:ui';
import 'package:flutter/material.dart';

class SquarePainter extends CustomPainter {
  double progress;
  Color color;
  final Paint _paint = Paint()
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5;
  SquarePainter({this.progress, this.color = Colors.purple});

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = color;
    if (progress > 0) {
      var path = createPath(4, size.width);
      PathMetric pathMetric = path.computeMetrics().first;
      Path extractPath =
          pathMetric.extractPath(0.0, pathMetric.length * progress);
      canvas.drawPath(extractPath, _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  Path createPath(int sides, double radius) {
    Path path = Path();
    // 根据三角形的系数画矩形
    double wFartor = 0.02; //左下
    double hFactor = 0.85; //右下
    double tFactor = 0.10; //顶部三角形
    path.moveTo(wFartor * radius, hFactor * radius);
    for (int i = 1; i <= sides; i++) {
      double x, y;
      if (i == 1) {
        x = wFartor * radius;
        y = -tFactor * radius;
      } else if (i == 2) {
        x = radius;
        y = -tFactor * radius;
      } else if (i == 3) {
        x = radius;
        y = radius * hFactor;
      } else if (i == 4) {
        x = wFartor * radius;
        y = radius * hFactor;
      }
      path.lineTo(x, y);
    }
    path.close();
    return path;
  }
}
