import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/asset_path.dart';
import 'package:movie_streaming_app/features/home/presentation/pages/home_page.dart';
import 'package:movie_streaming_app/features/login/presentation/pages/login.dart';
import 'package:movie_streaming_app/shared_widgets/app_logo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/ui_helper.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final int totalPages = 2;

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    double getFontSize(double size) => (SizeConfig.screenWidth / 375) * size;

    return Scaffold(
      backgroundColor: UiHelper.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const Spacer(),
                  AppLogo(),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (currentPage == 0) {
                        _pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                    },
                    child: UiHelper.customText(
                      color: AppColors.versionTextColor,
                      fontsize: getFontSize(16),
                      text: 'Skip',
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Extra space from top to push image down
                  SizedBox(height: SizeConfig.screenHeight * 0.05),

                  // Image - Fixed height
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.45,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      children: [
                        Image.asset(
                          AssetPath.onBoardingImageTwo,
                          fit: BoxFit.contain,
                        ),
                        Image.asset(
                          AssetPath.onBoardingImageOne,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  // gap between image & text

                  // Main Title
                  UiHelper.customText(
                    text: currentPage == 0
                        ? "Watch Your Best Movies in One App"
                        : "Best Service Features",
                    color: AppColors.mainTextColor,
                    fontfamily: "bold",
                    fontsize: getFontSize(16),
                  ),

                  const SizedBox(height: 10),

                  // Subtitle 1
                  UiHelper.customText(
                    text: currentPage == 0
                        ? "Unlimited access to millions of new and"
                        : "The features we provide will guarantee the",
                    color: AppColors.versionTextColor,
                    fontsize: getFontSize(14),
                  ),

                  // Subtitle 2
                  UiHelper.customText(
                    text: currentPage == 0
                        ? "quality movies just for you"
                        : "best quality for your streaming",
                    color: AppColors.versionTextColor,
                    fontsize: getFontSize(14),
                  ),

                  const SizedBox(height: 20),

                  // Smooth Page Indicator
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: totalPages,
                    effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                        width: 6,
                        height: 14,
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      dotDecoration: DotDecoration(
                        width: 6,
                        height: 6,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      spacing: 6,
                    ),
                  ),

                  const Spacer(),
                  // Buttons only for 2nd page
                  if (currentPage == 1)
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: (SizeConfig.screenHeight / 812) * 20,
                        left: SizeConfig.screenWidth * 0.08,
                        right: SizeConfig.screenWidth * 0.08,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: (SizeConfig.screenHeight / 812) * 48,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF282828),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                  );
                                },
                                child: UiHelper.customText(
                                  text: "Get Started",
                                  color: Colors.white,
                                  fontsize: getFontSize(16),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: SizeConfig.screenWidth * 0.04),

                          // gap
                          Expanded(
                            child: SizedBox(
                              height: (SizeConfig.screenHeight / 812) * 48,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  // Log in action
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                },
                                child: UiHelper.customText(
                                  text: "Log In",
                                  color: Colors.white,
                                  fontsize: getFontSize(16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
