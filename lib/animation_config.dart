import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HWAnimationConfig {
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
  static double screenWidth = mediaQuery.size.width;
  static double screenHeight = mediaQuery.size.height;
  // 最开始圆的宽度变化
  static TweenSequence circleWidthTweenSequence = TweenSequence([
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 120.0), weight: 5),
    TweenSequenceItem(tween: Tween(begin: 120.0, end: 130.0), weight: 10),
    TweenSequenceItem(tween: Tween(begin: 130.0, end: 120.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(120.0), weight: 20),
    // TweenSequenceItem(tween: Tween(begin: 120.0, end: 130.0), weight: 5),
    // TweenSequenceItem(tween: Tween(begin: 130.0, end: 120.0), weight: 5),
    // TweenSequenceItem(tween: ConstantTween<double>(120.0), weight: 10),
    TweenSequenceItem(tween: Tween(begin: 120.0, end: 10.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(10.0), weight: 45),
  ]);

//最开始圆的高度变化
  static TweenSequence circleHeightTweenSequence = TweenSequence([
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 120.0), weight: 5),
    TweenSequenceItem(tween: ConstantTween<double>(120.0), weight: 20),
    TweenSequenceItem(tween: Tween(begin: 120.0, end: 130.0), weight: 10),
    TweenSequenceItem(tween: Tween(begin: 130.0, end: 120.0), weight: 10),
    // TweenSequenceItem(tween: ConstantTween<double>(120.0), weight: 10),
    // TweenSequenceItem(tween: Tween(begin: 120.0, end: 130.0), weight: 5),
    // TweenSequenceItem(tween: Tween(begin: 130.0, end: 120.0), weight: 5),
    TweenSequenceItem(tween: Tween(begin: 120.0, end: 10.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(10.0), weight: 45),
  ]);

  static TweenSequence triangleSizeTweenSequence = TweenSequence([
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 120.0), weight: 15),
    TweenSequenceItem(tween: ConstantTween<double>(120.0), weight: 85),
  ]);

// 三角形的左、右、上变化过程
  static TweenSequence triangleLeftTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.2), weight: 15),
    TweenSequenceItem(tween: Tween(begin: 0.05, end: 0.02), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(0.02), weight: 75),
  ]);
  static TweenSequence triangleRightTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.8), weight: 25),
    TweenSequenceItem(tween: Tween(begin: 0.8, end: 0.98), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(0.98), weight: 65),
  ]);
  static TweenSequence triangleTopTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.05), weight: 35),
    TweenSequenceItem(tween: Tween(begin: 0.0, end: -0.1), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(-0.1), weight: 55),
  ]);

// 整体旋转的变化过程
  static TweenSequence rotationTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 45),
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 2.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(2.0), weight: 45),
  ]);
  // 线性矩形变化
  static TweenSequence rectTweenSequence1 = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 55),
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 10),
    TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 35),
  ]);
  static TweenSequence rectTweenSequence2 = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 65),
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 25),
  ]);
// 水波升高变化动画
  static TweenSequence waveTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 75),
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 15),
  ]);
  // 水波矩形最后偏移量的变化（由于根据三角形的偏移，最后整体都会向上偏移 10，这个动画最后要修正这个便宜）
  static TweenSequence waveOffsetYTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(-10.0), weight: 95),
    TweenSequenceItem(tween: Tween(begin: -10.0, end: 0.0), weight: 5),
  ]);
  // 水波宽高变化
  static TweenSequence waveWidthTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(120.0), weight: 80),
    TweenSequenceItem(tween: Tween(begin: 120.0, end: screenWidth), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(screenWidth), weight: 10),
  ]);
  static TweenSequence waveHeightTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(120.0), weight: 80),
    TweenSequenceItem(
        tween: Tween(begin: 120.0, end: screenHeight), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(screenHeight), weight: 10),
  ]);
  // 最后显示的文本变化过程
  static TweenSequence textSizeTweenSequence = TweenSequence([
    TweenSequenceItem(tween: ConstantTween<double>(0), weight: 85),
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 30.0), weight: 10),
    TweenSequenceItem(tween: ConstantTween<double>(50), weight: 5),
  ]);
}
