import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  bool rememberMe = false;

  checkBox(value) {
    rememberMe = value;
    update();
  }
}
