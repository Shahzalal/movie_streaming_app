import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  /// Initialize screen dimensions
  static void init(BuildContext context) {
    final mq = MediaQuery.of(context);

    // SafeArea out
    screenWidth = mq.size.width - mq.padding.left - mq.padding.right;
    screenHeight = mq.size.height - mq.padding.top - mq.padding.bottom;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }

  /// Width scaling method (responsive)
  static double ws(double px) {
    double scale = screenWidth / 375; // Base iPhone 11 width
    return (px * scale).clamp(px * 0.85, px * 1.2);
  }

  /// Height scaling method (responsive)
  static double hs(double px) {
    double scale = screenHeight / 812; // Base iPhone 11 height
    return (px * scale).clamp(px * 0.85, px * 1.2);
  }

  /// Font size scaling (responsive typography)
  static double fs(double fontSize) {
    double scale = (screenWidth / 375 + screenHeight / 812) / 2;
    return (fontSize * scale).clamp(fontSize * 0.9, fontSize * 1.3);
  }
}
