import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
import '../controller/register_controller.dart';

import '../../login/views/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Consumer<RegisterController>(builder: (context, registerConsumer, child) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: AppTheme.bgColor,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: registerConsumer.formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 64.0),
                      Image.asset('assets/logo-bg.png', width: 200,),
                      SizedBox(height: 32.0),
                      AppField(
                        controller: registerConsumer.emailController,
                        hint: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) return "Email is required";
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      IntlPhoneField(
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          isDense: true,
                          fillColor: Color(0xffF6F6F6),
                          filled: true,
                          hintText: "ssss",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffF6F6F60)),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          labelStyle: TextStyle(
                            color: AppTheme.primaryDarkColor,
                          ),
                        ),
                        style: TextStyle(color: AppTheme.primaryDarkColor),
                        languageCode: "en",
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                        onCountryChanged: (country) {
                          print('Country changed to: ' + country.name);
                        },
                      ),
                      SizedBox(height: 16.0),
                      AppPasswordField(
                        controller: registerConsumer.passwordController,
                        hint: 'Enter your password',
                        validator: (value) {
                          if (value!.isEmpty) return "Password is required";
                          return null;
                        },
                      ),
                      SizedBox(height: 24.0),
                      Center(
                        child: AppButton(
                            text: "Signup",
                            width: screenSize.width * 0.9,
                            btnColor: btnColor,
                            onPressed: () {
                              // replace(LayoutScreen());
                              // if (registerConsumer.formKey.currentState!.validate()) {}
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
                  replace(LoginScreen());
                },
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff1E232C),
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(text: 'Already have an account? '),
                      TextSpan(text: 'Login Now', style: TextStyle(fontWeight: FontWeight.w700, color: greenShade)),
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
      final registerController = Provider.of<RegisterController>(context, listen: false);
      registerController.dio = AppDio(context);
      registerController.logger.init();
    });
  }
}
