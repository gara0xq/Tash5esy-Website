import 'dart:developer';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool rememberMe = false;
  checkBox(value) {
    rememberMe = value;
    update();
  }

  PostgrestMap response = {};

  Future<bool> checkUserExists(String email) async {
    try {
      response = await Supabase.instance.client
          .from('users')
          .select()
          .eq('email', email)
          .single();
      return true;
    } catch (e) {
      log(response['message'].toString());
      return false;
    }
  }

  login() async {
    bool isExist = await checkUserExists(emailController.text);
    if (isExist && response["password"] == passwordController.text) {
      if (rememberMe) {
        window.localStorage["currentUser"] = response["id"];
      }
      update();
      Get.offAllNamed('/');
    } else {
      Get.snackbar(
          "Authintication Error", "email or password does not correct");
    }
  }
}
