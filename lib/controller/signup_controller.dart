import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tash5esy_website/view/widgets/successful_box.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool showedPassword = false;

  checkBox(value) {
    showedPassword = value;
    update();
  }

  signup() async {
    if (formKey.currentState!.validate()) {
      try {
        final supabase = Supabase.instance.client;
        final response = await supabase.from('users').insert({
          "first_name": firstNameController.text,
          "last_name": lastNameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "subscription": "",
        });
        if (response != null) {
          log('Error: $response');
        } else {
          log('Inserted: $response');
          Get.dialog(
            SuccessfulBox(
              title: "Account Created",
              description: "Your account has been created successfully.",
              route: "/login",
            ),
          );
        }
      } catch (e) {
        log("e: " + e.toString());
      }
    }
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return "Invalid name format";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)) {
      return "Invalid email format";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return "Password must be at least 8 characters";
    }
    if (!RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$").hasMatch(value)) {
      return "Password must contain letters and numbers";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
  if (value != passwordController.text) {
    return "Password not similar";
  }
  return null;
}
}
