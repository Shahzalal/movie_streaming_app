import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/utils/size_config.dart';
import '../core/utils/ui_helper.dart';

class MoviePlayButtonWidget extends StatelessWidget {
  const MoviePlayButtonWidget({
    super.key, this.onTap, required this.title,
  });
  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.hs(12),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  SizeConfig.ws(8),
                ),
              ),
            ),
            onPressed: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: SizeConfig.ws(20),
                ),
                SizedBox(width: SizeConfig.ws(8)),
                UiHelper.customText(
                  text: title,
                  fontsize: SizeConfig.ws(16),
                  color: Colors.white,
                  fontweight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: SizeConfig.ws(10)),
        Container(
          width: SizeConfig.ws(48),
          height: SizeConfig.ws(48),
          decoration: BoxDecoration(
            color: const Color(0xFF282828),
            borderRadius: BorderRadius.circular(
              SizeConfig.ws(8),
            ),
          ),
          child: IconButton(
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.white,
              size: SizeConfig.ws(22),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}