import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/controller/login_controller.dart';
import 'package:tash5esy_website/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF7FCFD),
      body: Row(
        children: [
          if (width > 1150)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/login.png",
                    scale: 2,
                  ),
                  Text(
                    "slogan".tr,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: width > 1150 ? width / 4 : width / 1.5,
                child: GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (controller) {
                    return Form(
                      key: controller.formKey,
                      child: Column(
                        spacing: 13,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/mini_logo.png"),
                          Text(
                            "login_to_account".tr,
                            style: TextStyle(
                              color: foriegnColor,
                              fontSize: 38,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "subslogan".tr,
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          InkWell(
                            onTap: () {},
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              height: 50,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                spacing: 20,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/icons/google.png"),
                                  Text(
                                    "continue_with_google".tr,
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              spacing: 10,
                              children: [
                                Spacer(),
                                Expanded(child: Divider()),
                                Text(
                                  "or_with_email".tr,
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Expanded(child: Divider()),
                                Spacer(),
                              ],
                            ),
                          ),
                          Text(
                            "email".tr,
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "mail@abc.com",
                              hintStyle: TextStyle(color: Colors.grey.shade300),
                            ),
                          ),
                          Text(
                            "pass".tr,
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          TextFormField(
                            controller: controller.passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "********",
                              hintStyle: TextStyle(color: Colors.grey.shade300),
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: controller.rememberMe,
                                onChanged: (value) =>
                                    controller.checkBox(value),
                              ),
                              Text(
                                "remmenber".tr,
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Text(
                                  "forget".tr,
                                  style: TextStyle(
                                      color: foriegnColor, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              controller.login();
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
                                "Login".tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Text(
                                "not_registered".tr,
                                style: TextStyle(color: Colors.black),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                  Get.toNamed('/signup');
                                },
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Text(
                                  "create_account".tr,
                                  style: TextStyle(
                                    color: foriegnColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
