import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/asset_path.dart';
import 'package:movie_streaming_app/features/login/presentation/pages/login.dart';
import 'package:movie_streaming_app/shared_widgets/app_logo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../bottom_navigation_bar/presentation/pages/bottom_navigation_bar.dart';

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

    return Scaffold(
      backgroundColor: UiHelper.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔹 Top Bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.ws(20),
                vertical: SizeConfig.hs(10),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  const AppLogo(),
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
                          MaterialPageRoute(
                            builder: (context) => const HomeBottomNavScreen(),
                          ),
                        );
                      }
                    },
                    child: UiHelper.customText(
                      color: AppColors.versionTextColor,
                      fontsize: SizeConfig.fs(16),
                      text: 'Skip',
                    ),
                  ),
                ],
              ),
            ),

            /// 🔹 Content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.hs(40)),

                  /// Image - Responsive Height
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.42,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() => currentPage = index);
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

                  SizedBox(height: SizeConfig.hs(30)),

                  /// Title
                  UiHelper.customText(
                    text: currentPage == 0
                        ? "Watch Your Best Movies in One App"
                        : "Best Service Features",
                    color: AppColors.mainTextColor,
                    fontfamily: "bold",
                    fontsize: SizeConfig.fs(18),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: SizeConfig.hs(10)),

                  /// Subtitle line 1
                  UiHelper.customText(
                    text: currentPage == 0
                        ? "Unlimited access to millions of new and"
                        : "The features we provide will guarantee the",
                    color: AppColors.versionTextColor,
                    fontsize: SizeConfig.fs(14),
                    textAlign: TextAlign.center,
                  ),

                  /// Subtitle line 2
                  UiHelper.customText(
                    text: currentPage == 0
                        ? "quality movies just for you"
                        : "best quality for your streaming",
                    color: AppColors.versionTextColor,
                    fontsize: SizeConfig.fs(14),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: SizeConfig.hs(20)),

                  /// Page Indicator
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: totalPages,
                    effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                        width: SizeConfig.ws(8),
                        height: SizeConfig.hs(14),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      dotDecoration: DotDecoration(
                        width: SizeConfig.ws(6),
                        height: SizeConfig.hs(6),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      spacing: SizeConfig.ws(6),
                    ),
                  ),

                  const Spacer(),

                  /// 🔹 Buttons (only visible on 2nd page)
                  if (currentPage == 1)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.ws(32),
                        vertical: SizeConfig.hs(20),
                      ),
                      child: Row(
                        children: [
                          /// Get Started
                          Expanded(
                            child: SizedBox(
                              height: SizeConfig.hs(48),
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
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: UiHelper.customText(
                                  text: "Get Started",
                                  color: Colors.white,
                                  fontsize: SizeConfig.fs(16),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: SizeConfig.ws(12)),

                          /// Log In
                          Expanded(
                            child: SizedBox(
                              height: SizeConfig.hs(48),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: UiHelper.customText(
                                  text: "Log In",
                                  color: Colors.white,
                                  fontsize: SizeConfig.fs(16),
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
