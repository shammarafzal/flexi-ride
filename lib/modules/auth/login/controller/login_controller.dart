import 'package:flutter/material.dart';

import '../../../../config/dio/app_dio.dart';
import '../../../../config/logger/app_logger.dart';


class LoginController extends ChangeNotifier {
  final focusNode = FocusNode();
  AppLogger logger = AppLogger();
  bool loading = false;
  late AppDio dio;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  updateState() {
    notifyListeners();
  }
}
