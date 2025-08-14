import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';
import 'package:movie_streaming_app/core/utils/ui_helper.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';
import 'package:movie_streaming_app/features/home/presentation/pages/home_page.dart';
import 'package:movie_streaming_app/shared_widgets/custom_status_bar.dart';
import 'package:pinput/pinput.dart';

import '../../../../shared_widgets/auth_app_bar_widget.dart';
import '../widgets/verify_otp_elevated_button.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final TextEditingController _otpController = TextEditingController();
  bool _isOtpFilled = false;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final defaultPinTheme = PinTheme(
      width: SizeConfig.ws(56),
      height: SizeConfig.hs(56),
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.ws(4)),
      textStyle: TextStyle(
        fontSize: SizeConfig.ws(20),
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(SizeConfig.ws(8)),
      ),
    );

    return CustomStatusBar(
      child: Scaffold(
        backgroundColor: UiHelper.scaffoldBg,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.ws(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthAppBarWidget(appTitle: 'OTP Verification'),
                  SizedBox(height: SizeConfig.hs(50)),

                  Center(
                    child: UiHelper.customText(
                      text: "Code is sent to +1 412 **** ***31",
                      color: AppColors.versionTextColor,
                      fontsize: SizeConfig.ws(14),
                    ),
                  ),

                  SizedBox(height: SizeConfig.hs(30)),

                  Center(
                    child: Pinput(
                      length: 4,
                      controller: _otpController,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(SizeConfig.ws(8)),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _isOtpFilled = value.length == 4;
                        });
                      },
                      onCompleted: (pin) {
                        setState(() {
                          _isOtpFilled = true;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: SizeConfig.hs(30)),

                  Center(
                    child: Column(
                      children: [
                        Text(
                          "By creating an account, you agree to our’s",
                          style: TextStyle(
                            color: AppColors.versionTextColor,
                            fontSize: SizeConfig.ws(14),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                "Privacy Policy",
                                style: TextStyle(
                                  color: AppColors.primaryBlue,
                                  fontSize: SizeConfig.ws(14),
                                ),
                              ),
                            ),
                            Text(
                              " And",
                              style: TextStyle(
                                color: AppColors.versionTextColor,
                                fontSize: SizeConfig.ws(14),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                " Terms of Use",
                                style: TextStyle(
                                  color: AppColors.primaryBlue,
                                  fontSize: SizeConfig.ws(14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: SizeConfig.hs(50)),

                  VerifyOtpElevatedButton(
                    isEmailFilled: _isOtpFilled,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  SizedBox(height: SizeConfig.hs(20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
