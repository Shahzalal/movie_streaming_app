import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/theme/app_colors.dart';
import '../core/utils/ui_helper.dart';
import '../core/utils/size_config.dart';

class ToastHelper {
  static void showSuccess(String message) {
    SizeConfig.init(Get.context!); // Initialize for responsive font/padding

    Get.snackbar(
      "",
      "", // Hide default title & message
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black,
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.ws(16),
        vertical: SizeConfig.hs(16),
      ),

      borderRadius: SizeConfig.ws(12),
      duration: Duration(seconds: 2),
      animationDuration: Duration(milliseconds: 400),
      titleText: UiHelper.customText(
        text: "Success",
        fontsize: SizeConfig.fs(14),
        fontweight: FontWeight.bold,
        color: Colors.white,
      ),
      messageText: UiHelper.customText(
        text: message,
        fontsize: SizeConfig.fs(12),
        color: Colors.white,
      ),
      icon: Icon(
        Icons.check_circle,
        color: AppColors.primaryBlue,
        size: SizeConfig.ws(20),
      ),
    );
  }

  static void showWarning(String message) {
    SizeConfig.init(Get.context!); // Initialize for responsive font/padding

    Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black,
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.ws(16),
        vertical: SizeConfig.hs(16),
      ),

      borderRadius: SizeConfig.ws(12),
      duration: Duration(seconds: 2),
      animationDuration: Duration(milliseconds: 400),
      titleText: UiHelper.customText(
        text: "Warning",
        fontsize: SizeConfig.fs(14),
        fontweight: FontWeight.bold,
        color: Colors.white,
      ),
      messageText: UiHelper.customText(
        text: message,
        fontsize: SizeConfig.fs(12),
        color: Colors.white,
      ),
      icon: Icon(Icons.error, color: Colors.redAccent, size: SizeConfig.ws(20)),
    );
  }
}
