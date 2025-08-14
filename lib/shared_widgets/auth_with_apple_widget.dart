import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/utils/size_config.dart';

class AuthWithAppleWidget extends StatelessWidget {
  const AuthWithAppleWidget({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.hs(48),
      child: OutlinedButton.icon(
        icon: const Icon(Icons.apple, color: Colors.black),
        label: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: SizeConfig.ws(16)),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.mainTextColor,
          side: const BorderSide(color: AppColors.versionTextColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}