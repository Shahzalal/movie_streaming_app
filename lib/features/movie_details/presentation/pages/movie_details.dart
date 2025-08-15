import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/ui_helper.dart';
import 'package:movie_streaming_app/shared_widgets/custom_status_bar.dart';
import 'package:movie_streaming_app/shared_widgets/movie_play_main_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/asset_path.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../shared_widgets/premium_plan_bottom_sheet.dart';
import '../widget/movie_description_sheet.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return CustomStatusBar(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Movie Poster Section
              Stack(
                children: [
                  Image.asset(
                    AssetPath.heroImage,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.hs(340),
                    fit: BoxFit.cover,
                  ),
                  // Gradient Overlay
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: SizeConfig.hs(120),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Color(0xB3000000)],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Movie Title
                  Positioned(
                    left: SizeConfig.ws(16),
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiHelper.customText(
                          text: "Rogue One: A Star Wars",
                          fontsize: SizeConfig.ws(24),
                          fontweight: FontWeight.bold,
                          color: AppColors.mainTextColor,
                        ),
                        UiHelper.customText(
                          text: "Story",
                          fontsize: SizeConfig.ws(24),
                          fontweight: FontWeight.bold,
                          color: AppColors.mainTextColor,
                        ),
                      ],
                    ),
                  ),
                  // Back Button
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.ws(8)),
                      child: Container(
                        width: SizeConfig.ws(40),
                        height: SizeConfig.hs(40),
                        decoration: BoxDecoration(
                          color: Color(0x4D000000),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: SizeConfig.ws(20),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Movie Info Section
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.ws(16),
                  vertical: SizeConfig.hs(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.hs(8)),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: SizeConfig.hs(3)),
                          child: Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: SizeConfig.ws(18),
                          ),
                        ),
                        SizedBox(width: SizeConfig.ws(4)),
                        UiHelper.customText(
                          text: "8.4",
                          fontsize: SizeConfig.ws(14),
                          color: AppColors.mainTextColor,
                        ),
                        SizedBox(width: SizeConfig.ws(12)),
                        UiHelper.customText(
                          text: "2016",
                          fontsize: SizeConfig.ws(14),
                          color: AppColors.versionTextColor,
                        ),
                        SizedBox(width: SizeConfig.ws(12)),
                        UiHelper.customText(
                          text: "1h 54m",
                          fontsize: SizeConfig.ws(14),
                          color: AppColors.versionTextColor,
                        ),
                        SizedBox(width: SizeConfig.ws(12)),
                        UiHelper.customText(
                          text: "Sci-Fi",
                          fontsize: SizeConfig.ws(14),
                          color: AppColors.versionTextColor,
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.hs(12)),
                    // Description + More Button
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text:
                                  "A Star Wars Story itself focuses on the Rebel Alliance which recruits Jyn Erso (Felicity Jones) after the formation of the Galaxy earning his livin... ",
                              style: TextStyle(
                                fontSize: SizeConfig.ws(14),
                                color: AppColors.versionTextColor,
                              ),
                              children: [
                                TextSpan(
                                  text: "More",
                                  style: TextStyle(
                                    fontSize: SizeConfig.ws(14),
                                    color: AppColors.primaryBlue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle More tap

                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(
                                              SizeConfig.ws(20),
                                            ),
                                          ),
                                        ),
                                        builder: (context) =>
                                            const MovieDescriptionSheet(),
                                      );
                                    },
                                ),
                              ],
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: SizeConfig.hs(20)),

                    // Trailers Section
                    UiHelper.customText(
                      text: "Trailers",
                      fontsize: SizeConfig.ws(16),
                      fontweight: FontWeight.w600,
                      color: AppColors.mainTextColor,
                    ),
                    SizedBox(height: SizeConfig.hs(12)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(SizeConfig.ws(6)),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            AssetPath.md1Image,
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.hs(200),
                            fit: BoxFit.cover,
                          ),
                          Icon(
                            Icons.play_circle_fill,
                            size: SizeConfig.ws(50),
                            color: AppColors.mainTextColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.hs(20)),

                    // Watch Movie Button
                    MoviePlayButtonWidget(
                      title: 'Watch Movie',
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true, // fullscreen height possible
                          backgroundColor: Colors.transparent,
                          builder: (_) => SizedBox(
                            height: MediaQuery.of(context).size.height * 0.85, // 85% height
                            child: PremiumPlanBottomSheet(),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: SizeConfig.hs(20)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
