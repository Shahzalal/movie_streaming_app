import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';

class UiHelper {
  static const Color scaffoldBg = AppColors.backgroundDark;

  static Text customText({
    required String text,
    required double fontsize,
    String? fontfamily,
    FontWeight? fontweight,
    Color? color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: fontfamily ?? "regular",
        color: color ?? Colors.black, // Default color (light mode)
        fontWeight: fontweight ?? FontWeight.normal,
      ),
    );
  }
}
