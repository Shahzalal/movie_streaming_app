import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/ui_helper.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    super.key,
    required this.title,
    required this.action, this.onActionTap,
  });

  final String title;
  final String action;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.ws(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UiHelper.customText(
            text: title,
            fontsize: SizeConfig.ws(18),
            fontweight: FontWeight.bold,
            color: AppColors.mainTextColor,
          ),
          action.isNotEmpty
              ? GestureDetector(
            onTap: onActionTap,
                child: UiHelper.customText(
                            text: action,
                            fontsize: SizeConfig.ws(14),
                            color: AppColors.mainTextColor,
                          ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}