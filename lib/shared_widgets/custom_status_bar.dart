import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomStatusBar extends StatelessWidget {
  final Widget child;
  final Color statusBarColor;
  final Brightness iconBrightness; // Android
  final Brightness iosBrightness;  // iOS

  const CustomStatusBar({
    super.key,
    required this.child,
    this.statusBarColor = Colors.transparent,
    this.iconBrightness = Brightness.light,
    this.iosBrightness = Brightness.dark,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: iconBrightness, // Android
        statusBarBrightness: iosBrightness, // iOS
      ),
      child: child,
    );
  }
}
