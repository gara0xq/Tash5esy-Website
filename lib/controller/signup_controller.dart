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
}
