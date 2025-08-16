import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/utils/size_config.dart';
import '../core/utils/ui_helper.dart';
import '../features/home/presentation/pages/home_page.dart';

class AuthAppBarWidget extends StatelessWidget {
  const AuthAppBarWidget({
    super.key, required this.appTitle,
  });

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        UiHelper.customText(
          text: appTitle,
          color: AppColors.mainTextColor,
          fontfamily: "bold",
          fontsize: SizeConfig.ws(20),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
          child: UiHelper.customText(
            text: "Skip",
            color: AppColors.versionTextColor,
            fontsize: SizeConfig.ws(16),
          ),
        ),
      ],
    );
  }
}