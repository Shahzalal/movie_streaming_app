
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../getx/controller/plan_controller.dart';
import '../widgets/plan_card_box_widget.dart';
import '../widgets/plan_card_features_widget.dart';
import '../widgets/style_plan_card.dart';

class PremiumPlanBottomSheet extends StatelessWidget {
  PremiumPlanBottomSheet({super.key});

  final PlanController planController = Get.put(PlanController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(SizeConfig.ws(20)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.ws(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle
              Container(
                width: SizeConfig.ws(40),
                height: SizeConfig.hs(4),
                margin: EdgeInsets.only(top: SizeConfig.hs(12), bottom: SizeConfig.hs(20)),
                decoration: BoxDecoration(
                  color: const Color(0x4DFFFFFF),
                  borderRadius: BorderRadius.circular(SizeConfig.ws(2)),
                ),
              ),

              // Scrollable Content
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UiHelper.customText(
                      text: "Subscribe to Premium Plan",
                      fontsize: SizeConfig.fs(20),
                      fontweight: FontWeight.bold,
                      color: AppColors.mainTextColor,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.hs(8)),
                    UiHelper.customText(
                      text:
                      "Get the premium plan and get unlimited access content for watching movies.",
                      fontsize: SizeConfig.fs(14),
                      color: AppColors.bodyTextColor,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                    SizedBox(height: SizeConfig.hs(24)),

                    // Plan Options
                    GetBuilder<PlanController>(
                      builder: (_) {
                        return Row(
                          children: [
                            Expanded(
                              child: StylePlanCard(
                                planController: planController,
                                title: "Annually",
                                price: "\$79.99 / year",
                                desc: "Billed annually with 14-day trial",
                              ),
                            ),
                            SizedBox(width: SizeConfig.ws(12)),
                            Expanded(
                              child: StylePlanCard(
                                planController: planController,
                                title: "Monthly",
                                price: "\$7.99 / month",
                                desc: "Billed monthly",
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: SizeConfig.hs(30)),

                    // Features
                    PlanCardFeaturesWidget(
                        icon: Icons.play_circle_fill,
                        title: "Unlimited Content",
                        subtitle: "Watching unlimited content in one app"),
                    PlanCardFeaturesWidget(
                        icon: Icons.group,
                        title: "Sharing Accounts",
                        subtitle: "Enjoy access with your beloved friends or family"),
                    PlanCardFeaturesWidget(
                        icon: Icons.star,
                        title: "FHD Quality",
                        subtitle: "The best service for you with best quality player"),
                    SizedBox(height: SizeConfig.hs(20)),
                  ],
                ),
              ),

              // Fixed Bottom Button
              PlanCardBoxWidget(),
            ],
          ),
        ),
      ),
    );
  }
}




