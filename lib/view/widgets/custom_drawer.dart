import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/controller/home_controller.dart';
import 'package:tash5esy_website/utils/colors.dart';
import 'package:tash5esy_website/view/widgets/lang_toggle_button.dart';
import 'package:tash5esy_website/view/widgets/login_button.dart';
import 'package:tash5esy_website/view/widgets/signup_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      width: 300,
      decoration: BoxDecoration(
        color: Color(0xffF7FCFD),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _customTap(title: "Home", key: controller.homeKey),
          _customTap(title: "Our Services", key: controller.ourServiceKey),
          _customTap(title: "Pricing"),
          _customTap(title: "About Us", key: controller.aboutUsKey),
          _customTap(title: "Contact Us", key: controller.contactUsKey),
          SignupButton(),
          LoginButton(),
          LangToggleButton(controller: controller),
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
        if (key != null) {
          controller.scrollController(key);
          Get.back();
        }
        else{
          
        }
      },
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
