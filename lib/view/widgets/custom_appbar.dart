import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/utils/colors.dart';
import 'package:tash5esy_website/view/widgets/lang_toggle_button.dart';
import 'package:tash5esy_website/view/widgets/login_button.dart';
import 'package:tash5esy_website/view/widgets/signup_button.dart';

class CustomAppBar extends StatelessWidget {
  final dynamic controller;
  final bool inPricing;
  const CustomAppBar({
    super.key,
    required this.controller,
    this.inPricing = false,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      constraints: BoxConstraints(maxWidth: 1400),
      child: Row(
        spacing: 15,
        children: [
          Container(
            height: 90,
            width: width / 7.5,
            constraints: BoxConstraints(maxWidth: 250, minWidth: 180),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
          ),
          Spacer(),
          if (width > 800) _customTap(title: "Home".tr, key: controller.homeKey),
          if (width > 800)
            _customTap(title: "Our Services".tr, key: controller.ourServiceKey),
          if (width > 800) _customTap(title: "Pricing".tr),
          if (width > 800)
            _customTap(title: "About Us".tr, key: controller.aboutUsKey),
          if (width > 800)
            _customTap(title: "Contact Us".tr, key: controller.contactUsKey),
          if (width > 800) Spacer(),
          if (width > 1150 && controller.username == null) SignupButton(),
          if (width > 1150 && controller.username == null) LoginButton(),
          if (controller.username != null)
            InkWell(
              onTap: () {
                Get.dialog(Dialog(
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 30,
                      children: [
                        Text(
                          "Do you want to logout?",
                          style: TextStyle(
                              fontSize: 30,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            controller.logout();
                          },
                          child: Container(
                            width: 150,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.red,
                            ),
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: foriegnColor, width: 2),
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Text(
                      controller.username,
                      style: TextStyle(
                        color: foriegnColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.person, color: foriegnColor),
                  ],
                ),
              ),
            ),
          if (width > 1150) LangToggleButton(controller: controller),
        ],
      ),
    );
  }

  Widget _customTap({
    required String title,
    GlobalKey? key,
  }) {
    return InkWell(
      onTap: () {
        controller.scrollController(key);
      },
      borderRadius: BorderRadius.circular(7),
      hoverColor: foriegnColor.withAlpha(30),
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
