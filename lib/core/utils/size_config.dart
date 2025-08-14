import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  /// Initialize screen dimensions
  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  /// Width scaling method
  static double ws(double px) {
    return (screenWidth / 375) * px;
  }

  /// Height scaling method
  static double hs(double px) {
    return (screenHeight / 812) * px;
  }
}

