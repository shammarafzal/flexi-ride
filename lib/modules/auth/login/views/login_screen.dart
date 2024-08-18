import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:req_fun/req_fun.dart';

import '../../../../config/dio/app_dio.dart';
import '../../../../constants/app_colors.dart';
import '../../../../resources/res/app_theme.dart';
import '../../../../resources/widgets/button/app_button.dart';
import '../../../../resources/widgets/fields/app_fields.dart';
import '../../../../resources/widgets/fields/password_field.dart';
import '../../../../resources/widgets/others/app_text.dart';
import '../../../../resources/widgets/others/sized_boxes.dart';
import '../controller/login_controller.dart';
import '../../register/views/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Consumer<LoginController>(builder: (context, loginConsumer, child) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: AppTheme.bgColor,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: loginConsumer.formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 64.0),
                      Image.asset('assets/logo-bg.png', width: 200,),
                      SizedBox(height: 32.0),
                      AppField(
                        controller: loginConsumer.emailController,
                        hint: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) return "Email is required";
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      AppPasswordField(
                        controller: loginConsumer.passwordController,
                        hint: 'Enter your password',
                        validator: (value) {
                          if (value!.isEmpty) return "Password is required";
                          return null;
                        },
                      ),
                      SizedBox(height: 12.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            // push(ForgotPasswordScreen());
                          },
                          child: AppText("Forgot Password?", size: 15.0, bold: true, color: greenShade,),
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Center(
                        child: AppButton(
                            text: "Login",
                            width: screenSize.width * 0.9,
                            btnColor: btnColor,
                            onPressed: () {
                              // replace(LayoutScreen());
                              // if (loginConsumer.formKey.currentState!.validate()) {}
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: BottomAppBar(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  replace(RegisterScreen());
                },
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff1E232C),
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(text: 'Don’t have an account? '),
                      TextSpan(text: 'Register Now', style: TextStyle(fontWeight: FontWeight.w700, color: greenShade)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              elevation: 0,
            ),
          ),
        ),
      );
    });
  }

  _init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final loginController = Provider.of<LoginController>(context, listen: false);
      loginController.dio = AppDio(context);
      loginController.logger.init();
    });
  }
}
