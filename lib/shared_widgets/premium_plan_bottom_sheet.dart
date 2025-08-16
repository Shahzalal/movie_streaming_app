import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/video/presentation/pages/video_player.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/ui_helper.dart';
import '../features/getx/controller/plan_controller.dart';

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
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: SizeConfig.ws(40),
                  height: SizeConfig.hs(4),
                  margin: EdgeInsets.only(top: SizeConfig.hs(12)),
                  decoration: BoxDecoration(
                    color: const Color(0x4DFFFFFF),
                    borderRadius: BorderRadius.circular(SizeConfig.ws(2)),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.hs(30)),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UiHelper.customText(
                        text: "Subscribe to Premium Plan",
                        fontsize: SizeConfig.ws(20),
                        fontweight: FontWeight.bold,
                        color: AppColors.mainTextColor,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: SizeConfig.hs(8)),
                      UiHelper.customText(
                        text:
                        "Get the premium plan and get unlimited access content for watching movies.",
                        fontsize: SizeConfig.ws(14),
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
                              _buildPlanCard(title: "Annually", price: "\$79.99 / year", desc: "Billed annually with 14-day"),
                              SizedBox(width: SizeConfig.ws(12)),
                              _buildPlanCard(title: "Monthly", price: "\$7.99 / monthly", desc: "Billed monthly"),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: SizeConfig.hs(30)),

                      // Features
                      _buildFeatureItem(
                        Icons.play_circle_fill,
                        "Unlimited Content",
                        "Watching unlimited content in one app",
                      ),
                      _buildFeatureItem(
                        Icons.group,
                        "Sharing Accounts",
                        "Enjoy access with your beloved friends or family",
                      ),
                      _buildFeatureItem(
                        Icons.star,
                        "FHD Quality",
                        "The best service for you with best quality player",
                      ),
                    ],
                  ),
                ),
              ),

              // Fixed Bottom Button
              Padding(
                padding: EdgeInsets.only(bottom: SizeConfig.hs(40)),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.hs(14),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SizeConfig.ws(12)),
                      ),
                    ),
                    onPressed: () {
                      // Action
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomVideoPlayer()));
                    },
                    child: UiHelper.customText(
                      text: "Start your 14-days trial",
                      fontsize: SizeConfig.ws(16),
                      color: AppColors.mainTextColor,
                      fontweight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required String desc,
  }) {
    return Expanded(
      child: GestureDetector(
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
                    fontsize: SizeConfig.ws(12),
                    fontweight: FontWeight.bold,
                    color: AppColors.mainTextColor,
                  ),
                  SizedBox(height: SizeConfig.hs(6)),
                  UiHelper.customText(
                    text: price,
                    fontsize: SizeConfig.ws(16),
                    fontweight: FontWeight.bold,
                    color: AppColors.mainTextColor,
                  ),
                  SizedBox(height: SizeConfig.hs(4)),
                  UiHelper.customText(
                    text: desc,
                    fontsize: SizeConfig.ws(10),
                    color: AppColors.bodyTextColor,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String subtitle) {
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
