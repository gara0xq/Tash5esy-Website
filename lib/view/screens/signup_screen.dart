import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/controller/signup_controller.dart';
import 'package:tash5esy_website/utils/colors.dart';
import 'package:tash5esy_website/view/widgets/successful_box.dart';

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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 15,
                        children: [
                          Image.asset('assets/images/mini_logo.png'),
                          Text(
                            "Create an account",
                            style: TextStyle(
                              fontSize: 24,
                              color: foriegnColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Text("Already have an account?"),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                  Get.toNamed('/login');
                                },
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Text(
                                  "Login",
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
                                child: _inputField(
                                  "First Name",
                                  controller: controller.firstNameController,
                                ),
                              ),
                              Expanded(
                                child: _inputField(
                                  "Last Name",
                                  controller: controller.lastNameController,
                                ),
                              ),
                            ],
                          ),
                          _inputField(
                            "Email Address",
                            controller: controller.emailController,
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                child: _inputField(
                                  "Password",
                                  controller: controller.passwordController,
                                  obscure: !controller.showedPassword,
                                ),
                              ),
                              Expanded(
                                child: _inputField(
                                  "Confirm Password",
                                  controller:
                                      controller.confirmPasswordController,
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
                                "Show Password",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.dialog(
                                SuccessfulBox(
                                  title: "Account Created",
                                  description:
                                      "Your account has been created successfully.",
                                  route: "/login",
                                ),
                              );
                            },
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: foriegnColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Text(
                                "Create an account",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ],
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
