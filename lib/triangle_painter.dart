import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  Color color;
  Paint _paint = Paint()
    ..strokeWidth = 5.0
    ..color = Colors.purple
    ..isAntiAlias = true
    ..strokeJoin = StrokeJoin.round;
  Path _path = Path();
  double left;
  double right;
  double top;
  TrianglePainter({this.left, this.right, this.top});

  @override
  void paint(Canvas canvas, Size size) {
    final _width = size.width;
    final _height = size.height;
    _path.moveTo(left * _width, 0.85 * _height);
    _path.lineTo(right * _width, 0.85 * _height);
    _path.lineTo(0.5 * _width, top * _height);
    _path.close();
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
