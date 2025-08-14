import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/ui_helper.dart';
import 'package:movie_streaming_app/features/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:movie_streaming_app/features/splash/widgets/custom_status_bar.dart';
import 'package:movie_streaming_app/shared_widgets/app_logo.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return CustomStatusBar(
      child: Scaffold(
        backgroundColor: UiHelper.scaffoldBg,
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 0.8,
              colors: [Color(0xFF0055AA), Colors.black],
              stops: [0.0, 1.0],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                AppLogo(width: 200),
                const Spacer(),
                UiHelper.customText(
                  text: 'Version 2.04.3.1',
                  fontsize: 12,
                  color: AppColors.versionTextColor,
                  fontfamily: 'regular',
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
