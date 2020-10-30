import 'dart:math' as Math;
import 'package:flutter/material.dart';

class HWWaveProgress extends StatefulWidget {
  final double size, progress, offsetY, borderWidth;
  final Color backgroundColor, waveColor, borderColor;

  HWWaveProgress(
      {this.size = 200.0,
      this.backgroundColor = Colors.blue,
      this.waveColor = Colors.white,
      this.borderColor = Colors.white,
      this.borderWidth = 10.0,
      this.progress = 50.0,
      this.offsetY = 0.0})
      : assert(progress >= 0 && progress <= 100,
            'Valid range of progress value is [0.0, 100.0]'),
        assert(offsetY >= -10 && offsetY <= 0,
            'This value offsetY mast [-10.0, 0.0]');

  @override
  _WaveWidgetState createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<HWWaveProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return (widget.progress > 0 && widget.progress < 100)
              ? CustomPaint(
                  painter: WaveWidgetPainter(
                      animation: _animationController,
                      backgroundColor: widget.backgroundColor,
                      waveColor: widget.waveColor,
                      borderColor: widget.borderColor,
                      borderWidth: widget.borderWidth,
                      progress: widget.progress),
                )
              : Transform.translate(
                  offset: Offset(0, widget.offsetY),
                  child: Container(
                    color: widget.progress == 100
                        ? widget.waveColor
                        : Colors.transparent,
                    width: widget.progress == 100 ? widget.size : 0,
                    height: widget.progress == 100 ? widget.size : 0,
                  ),
                );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class WaveWidgetPainter extends CustomPainter {
  Animation<double> animation;
  Color backgroundColor, waveColor, borderColor;
  double borderWidth, progress;

  WaveWidgetPainter(
      {this.animation,
      this.backgroundColor,
      this.waveColor,
      this.borderColor,
      this.borderWidth,
      this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = this.backgroundColor
      ..style = PaintingStyle.fill;

// 由于之前的三角形有向上偏移，所以画出来的矩形也需要向上偏移
    Offset center = Offset(size.width / 2, size.height / 2 - 15);
    double radius = Math.min(size.width / 2 - 5, size.height / 2 - 5);

    canvas.drawRect(
        Rect.fromCircle(center: center, radius: radius), backgroundPaint);

    // 画水波纹动画
    Paint wavePaint = new Paint()..color = waveColor;
    // 水波振幅
    double amp = 2.0;
    double p = progress / 100.0;
    double baseHeight = (1 - p) * size.height;

    Path path = Path();
    path.moveTo(0.0, baseHeight);
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(
          i,
          baseHeight +
              Math.sin((i / size.width * 2 * Math.pi) +
                      (animation.value * 2 * Math.pi)) *
                  amp -
              15);
    }

    path.lineTo(size.width, size.height - 15);
    path.lineTo(0.0, size.height - 15);
    path.close();
    canvas.drawPath(path, wavePaint);

    // 外边框
    Paint borderPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = this.borderWidth;

    canvas.drawRect(
        Rect.fromCircle(center: center, radius: radius), borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
