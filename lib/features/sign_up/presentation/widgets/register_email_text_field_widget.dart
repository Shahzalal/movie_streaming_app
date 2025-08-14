import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class RegisterEmailTextFieldWidget extends StatelessWidget {
  const RegisterEmailTextFieldWidget({
    super.key,
    required this.emailController,
    required this.emailFocusNode,
  });

  final TextEditingController emailController;
  final FocusNode emailFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      focusNode: emailFocusNode,
      style: const TextStyle(color: AppColors.mainTextColor),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email, color: AppColors.mainTextColor),

        hintText: "Email",
        hintStyle: const TextStyle(color: AppColors.versionTextColor),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.versionTextColor),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryBlue),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
