import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/ui_helper.dart';

class RegisterElevatedButtonWidget extends StatelessWidget {
  final bool isEmailFilled;

  const RegisterElevatedButtonWidget({
    super.key,
    required this.isEmailFilled,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.hs(48),
      child: ElevatedButton(
        onPressed: isEmailFilled ? () {} : null,
        style: ElevatedButton.styleFrom(
          backgroundColor:
          isEmailFilled ? AppColors.primaryBlue : Colors.white10,
          foregroundColor:
          isEmailFilled ? Colors.white : AppColors.mainTextColor.withOpacity(0.3),
          disabledBackgroundColor: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: UiHelper.customText(
          text: "Create Account",
          color: Colors.white,
          fontsize: SizeConfig.ws(16),
        ),
      ),
    );
  }
}