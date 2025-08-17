import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../getx/controller/account_controller.dart';
import '../../../getx/controller/plan_controller.dart';
import '../../../../shared_widgets/toast_helper.dart';

class PlanCardBoxWidget extends StatelessWidget {
  const PlanCardBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final planController = Get.find<PlanController>();

    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.hs(40)),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            padding: EdgeInsets.symmetric(vertical: SizeConfig.hs(14)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeConfig.ws(12)),
            ),
          ),
          onPressed: () {
            if (planController.selectedPlan.isEmpty) {
              ToastHelper.showWarning("Please select a plan");
              return;
            }

            // Show success toast
            ToastHelper.showSuccess(
              "You selected ${planController.selectedPlan}",
            );

            // Close BottomSheet
            Navigator.pop(context);

            // Turn ON subscription
            final accountController = Get.find<AccountController>();
            accountController.activateSubscription();
          },

          child: UiHelper.customText(
            text: "Start your 14-days trial",
            fontsize: SizeConfig.fs(16),
            color: AppColors.mainTextColor,
            fontweight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
