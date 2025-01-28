import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/controller/signup_controller.dart';
import 'package:tash5esy_website/utils/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF7FCFD),
      body: Center(
        child: Container(
          width: width > 1150 ? width / 2 : width,
          margin: EdgeInsets.symmetric(vertical: 100),
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border:
                width > 1150 ? Border.all(color: Colors.grey, width: 1) : null,
          ),
          child: Row(
            children: [
              GetBuilder<SignupController>(
                  init: SignupController(),
                  builder: (controller) {
                    return Expanded(
                      flex: 3,
                      child: Form(
                        key: controller.formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 15,
                            children: [
                              Image.asset('assets/images/mini_logo.png'),
                              Text(
                                "create_account".tr,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: foriegnColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                spacing: 5,
                                children: [
                                  Text("already_have_account".tr),
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                      Get.toNamed('/login');
                                    },
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    child: Text(
                                      "Login".tr,
                                      style: TextStyle(
                                          color: foriegnColor, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  Expanded(
                                    child: _inputField("first_name".tr,
                                        controller:
                                            controller.firstNameController,
                                        validator: (value) =>
                                            controller.validateName(value)),
                                  ),
                                  Expanded(
                                    child: _inputField("last_name".tr,
                                        controller:
                                            controller.lastNameController,
                                        validator: (value) =>
                                            controller.validateName(value)),
                                  ),
                                ],
                              ),
                              _inputField("email".tr,
                                  controller: controller.emailController,
                                  validator: (value) =>
                                      controller.validateEmail(value)),
                              Row(
                                spacing: 10,
                                children: [
                                  Expanded(
                                    child: _inputField("pass".tr,
                                        controller:
                                            controller.passwordController,
                                        obscure: !controller.showedPassword,
                                        validator: (value) =>
                                            controller.validatePassword(value)),
                                  ),
                                  Expanded(
                                    child: _inputField(
                                      "confirm_pass".tr,
                                      controller:
                                          controller.confirmPasswordController,
                                      validator: (value) => controller
                                          .validateConfirmPassword(value),
                                      obscure: !controller.showedPassword,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: controller.showedPassword,
                                    onChanged: (value) =>
                                        controller.checkBox(value),
                                  ),
                                  Text(
                                    "show_pass".tr,
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.signup();
                                },
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: foriegnColor,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Text(
                                    "create_account".tr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              if (width > 1150)
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    "assets/images/signup.png",
                    scale: 1.2,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(
    String label, {
    required TextEditingController controller,
    String? Function(String?)? validator,
    bool obscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 7,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade600)),
        TextFormField(
          obscureText: obscure,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
