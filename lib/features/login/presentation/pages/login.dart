import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';
import 'package:movie_streaming_app/core/utils/ui_helper.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';
import 'package:movie_streaming_app/shared_widgets/custom_status_bar.dart';

import '../../../../shared_widgets/auth_app_bar_widget.dart';
import '../../../../shared_widgets/auth_with_apple_widget.dart';
import '../../../../shared_widgets/auth_with_google_widget.dart';
import '../../../sign_up/presentation/pages/sign_up_page.dart';
import '../widgets/login_email_text_field_widget.dart';
import '../../../../shared_widgets/password_text_field_widget.dart';
import '../widgets/login_elevated_button_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  AuthAppBarWidget(appTitle: 'Login',),
      
                  SizedBox(height: SizeConfig.hs(40)),
      
                  UiHelper.customText(
                    text: "Welcome to Moviers",
                    color: AppColors.mainTextColor,
                    fontweight: FontWeight.bold,
                    fontfamily: "bold",
                    fontsize: SizeConfig.ws(20),
                  ),
      
                  SizedBox(height: SizeConfig.hs(30)),
      
                  // Email field
                  LoginEmailTextFieldWidget(emailController: _emailController, emailFocusNode: _emailFocusNode),
      
                  SizedBox(height: SizeConfig.hs(20)),
      
                  // Password
                  PasswordTextFieldWidget(hintText: "Password",),
      
                  SizedBox(height: SizeConfig.hs(15)),
      
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: UiHelper.customText(
                        text: "Forgot Password?",
                        color: AppColors.mainTextColor,
                        fontsize: SizeConfig.ws(14),
                      ),
                    ),
                  ),
      
                  SizedBox(height: SizeConfig.hs(12)),
      
                  // Login Button
                  LoginElevatedButtonWidget(isEmailFilled: _isEmailFilled),
      
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
                  AuthWithAppleWidget(title: 'Login With Apple',),
      
                  SizedBox(height: SizeConfig.hs(15)),
      
                  // Google Login
                  AuthWithGoogleWidget(title: 'Login With Google',),
      
                  SizedBox(height: SizeConfig.hs(100)),
      
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: AppColors.versionTextColor,
                            fontSize: SizeConfig.ws(14),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle sign-up navigation
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero, // removes default padding
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.ws(14),
                            ),
                          ),
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













