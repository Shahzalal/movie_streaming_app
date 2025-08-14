import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      style: const TextStyle(color: AppColors.mainTextColor),
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock,
          color: AppColors.mainTextColor,
        ),
        hintText: "Password",
        hintStyle: const TextStyle(
          color: AppColors.versionTextColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.versionTextColor,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryBlue,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}