import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/asset_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key,this.height,this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPath.appLogo,
      width: width??120,
      height: height,
      fit: BoxFit.scaleDown,
    );
  }
}
