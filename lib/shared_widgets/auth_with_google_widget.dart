import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/utils/asset_path.dart';
import '../core/utils/size_config.dart';

class AuthWithGoogleWidget extends StatelessWidget {
  const AuthWithGoogleWidget({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.hs(48),
      child: OutlinedButton.icon(
        icon: Image.asset(AssetPath.googleImage, height: SizeConfig.hs(20)),
        label: Text(
          title,
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: SizeConfig.ws(16),
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}