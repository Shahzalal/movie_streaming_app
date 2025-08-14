import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';
import 'package:movie_streaming_app/core/utils/ui_helper.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';
import 'package:movie_streaming_app/shared_widgets/custom_status_bar.dart';

import '../../../../shared_widgets/auth_app_bar_widget.dart';
import '../../../../shared_widgets/auth_with_apple_widget.dart';
import '../../../../shared_widgets/auth_with_google_widget.dart';
import '../../../../shared_widgets/password_text_field_widget.dart';
import '../widgets/date_text_field_widget.dart';
import '../widgets/register_elevated_button_widget.dart';
import '../widgets/register_email_text_field_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailFilled = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _isEmailFilled = _emailController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

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
                  // Top bar
                  AuthAppBarWidget(appTitle: 'Register'),

                  SizedBox(height: SizeConfig.hs(30)),

                  UiHelper.customText(
                    text: "Create New Account",
                    color: AppColors.mainTextColor,
                    fontweight: FontWeight.bold,
                    fontfamily: "bold",
                    fontsize: SizeConfig.ws(20),
                  ),

                  SizedBox(height: SizeConfig.hs(25)),

                  // Email field
                  RegisterEmailTextFieldWidget(
                    emailController: _emailController,
                    emailFocusNode: _emailFocusNode,
                  ),

                  SizedBox(height: SizeConfig.hs(20)),

                  // Password
                  PasswordTextFieldWidget(hintText: "Password"),
                  SizedBox(height: SizeConfig.hs(20)),

                  // Confirm Password
                  PasswordTextFieldWidget(hintText: 'Confirm Password'),
                  SizedBox(height: SizeConfig.hs(20)),

                  // Date
                  DateTextFieldWidget(hintText: 'DD/MM/YYYY'),

                  SizedBox(height: SizeConfig.hs(15)),

                  // Register Button
                  RegisterElevatedButtonWidget(isEmailFilled: _isEmailFilled),

                  SizedBox(height: SizeConfig.hs(20)),

                  Center(
                    child: UiHelper.customText(
                      text: "or",
                      color: AppColors.versionTextColor,
                      fontsize: SizeConfig.ws(14),
                    ),
                  ),

                  SizedBox(height: SizeConfig.hs(20)),

                  // Apple Login
                  AuthWithAppleWidget(title: 'Register With Apple'),

                  SizedBox(height: SizeConfig.hs(15)),

                  // Google Login
                  AuthWithGoogleWidget(title: 'Register With Google'),

                  SizedBox(height: SizeConfig.hs(100)),

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
                              onPressed: () {
                                // Handle sign-up navigation
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                // removes default padding
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                "Privacy Policy",
                                style: TextStyle(
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.ws(14),
                                ),
                              ),
                            ),
                            Text(
                              "And",
                              style: TextStyle(
                                color: AppColors.versionTextColor,
                                fontSize: SizeConfig.ws(14),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Handle sign-up navigation
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                // removes default padding
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                "Terms of Use",
                                style: TextStyle(
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.ws(14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
