

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/ui_helper.dart';

class PlanCardFeaturesWidget extends StatelessWidget {
  const PlanCardFeaturesWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.hs(16)),
      child: Row(
        children: [
          Container(
            width: SizeConfig.ws(40),
            height: SizeConfig.ws(40),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(SizeConfig.ws(8)),
            ),
            child: Icon(icon, color: AppColors.mainTextColor),
          ),
          SizedBox(width: SizeConfig.ws(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiHelper.customText(
                  text: title,
                  fontsize: SizeConfig.ws(14),
                  fontweight: FontWeight.bold,
                  color: AppColors.mainTextColor,
                ),
                SizedBox(height: SizeConfig.hs(4)),
                UiHelper.customText(
                  text: subtitle,
                  fontsize: SizeConfig.ws(12),
                  color: AppColors.bodyTextColor,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}