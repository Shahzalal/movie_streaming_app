import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../getx/controller/plan_controller.dart';

class PlanCardWidget extends StatelessWidget {
  const PlanCardWidget({
    super.key,
    required this.planController,
    required this.title,
    required this.price,
    required this.desc,
  });

  final PlanController planController;
  final String title;
  final String price;
  final String desc;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GestureDetector(
      onTap: () => planController.selectPlan(title),
      child: GetBuilder<PlanController>(
        builder: (_) {
          bool isSelected = planController.selectedPlan == title;
          return Container(
            padding: EdgeInsets.all(SizeConfig.ws(12)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.ws(12)),
              border: Border.all(
                color: isSelected ? AppColors.primaryBlue : Colors.grey,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                UiHelper.customText(
                  text: title,
                  fontsize: SizeConfig.fs(14),
                  fontweight: FontWeight.bold,
                  color: AppColors.mainTextColor,
                ),
                SizedBox(height: SizeConfig.hs(6)),
                UiHelper.customText(
                  text: price,
                  fontsize: SizeConfig.fs(16),
                  fontweight: FontWeight.bold,
                  color: AppColors.mainTextColor,
                ),
                SizedBox(height: SizeConfig.hs(4)),
                UiHelper.customText(
                  text: desc,
                  fontsize: SizeConfig.fs(12),
                  color: AppColors.bodyTextColor,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
