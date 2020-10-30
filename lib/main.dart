import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'animation_config.dart';
import 'square_painter.dart';
import 'wave_progress.dart';
import 'triangle_painter.dart';

main(List<String> args) => runApp(HWAnimationDemo());

class HWAnimationDemo extends StatelessWidget {
  const HWAnimationDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HWAnimatePage(),
      ),
    );
  }
}

class HWAnimatePage extends StatefulWidget {
  HWAnimatePage({Key key}) : super(key: key);

  @override
  _HWAnimatePageState createState() => _HWAnimatePageState();
}

class _HWAnimatePageState extends State<HWAnimatePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _circleWidthTween;
  Animation _circleHeightTween;
  Animation _triangleSizeTween;
  Animation _triangleLeftTween;
  Animation _triangleRightTween;
  Animation _triangleTopTween;
  Animation _rotationTween;
  Animation _rect1Tween;
  Animation _rect2Tween;
  Animation _waveProgressTween;
  Animation _waveOffsetYTween;
  Animation _waveWidthTween;
  Animation _waveHeightTween;
  Animation _textSizeTween;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3000))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              print('Animate completed');
            }
          });

    CurvedAnimation _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);

    _circleWidthTween =
        HWAnimationConfig.circleWidthTweenSequence.animate(_curvedAnimation);
    _circleHeightTween =
        HWAnimationConfig.circleHeightTweenSequence.animate(_curvedAnimation);
    _triangleSizeTween =
        HWAnimationConfig.triangleSizeTweenSequence.animate(_curvedAnimation);
    _triangleLeftTween =
        HWAnimationConfig.triangleLeftTweenSequence.animate(_curvedAnimation);
    _triangleRightTween =
        HWAnimationConfig.triangleRightTweenSequence.animate(_curvedAnimation);
    _triangleTopTween =
        HWAnimationConfig.triangleTopTweenSequence.animate(_curvedAnimation);
    _rotationTween =
        HWAnimationConfig.rotationTweenSequence.animate(_curvedAnimation);
    _rect1Tween =
        HWAnimationConfig.rectTweenSequence1.animate(_curvedAnimation);
    _rect2Tween =
        HWAnimationConfig.rectTweenSequence2.animate(_curvedAnimation);
    _waveProgressTween =
        HWAnimationConfig.waveTweenSequence.animate(_curvedAnimation);
    _waveOffsetYTween =
        HWAnimationConfig.waveOffsetYTweenSequence.animate(_curvedAnimation);
    _waveWidthTween = HWAnimationConfig.waveWidthTweenSequence
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _waveHeightTween = HWAnimationConfig.waveHeightTweenSequence
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _textSizeTween = HWAnimationConfig.textSizeTweenSequence
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Center(
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(Math.pi * _rotationTween.value),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Container(
                    color: Colors.purple,
                    height: _circleHeightTween.value,
                    width: _circleWidthTween.value,
                  ),
                ),
                Container(
                  height: _triangleSizeTween.value,
                  width: _triangleSizeTween.value,
                  child: CustomPaint(
                    painter: TrianglePainter(
                      left: _triangleLeftTween.value,
                      right: _triangleRightTween.value,
                      top: _triangleTopTween.value,
                    ),
                  ),
                ),
                Container(
                  height: _triangleSizeTween.value,
                  width: _triangleSizeTween.value,
                  child: CustomPaint(
                    painter: SquarePainter(progress: _rect1Tween.value),
                  ),
                ),
                Container(
                  height: _triangleSizeTween.value,
                  width: _triangleSizeTween.value,
                  child: CustomPaint(
                    painter: SquarePainter(
                      progress: _rect2Tween.value,
                      color: Color(0xff40e0b0),
                    ),
                  ),
                ),
                Container(
                  height: _waveHeightTween.value,
                  width: _waveWidthTween.value,
                  child: HWWaveProgress(
                    size: 120,
                    borderWidth: 0.0,
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    waveColor: Color(0xff40e0b0),
                    progress: 100 * _waveProgressTween.value,
                    offsetY: _waveOffsetYTween.value,
                  ),
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: _textSizeTween.value,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.stop();
    _controller.dispose();
  }
}
