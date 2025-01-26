import 'package:flutter/material.dart';
import 'package:tash5esy_website/controller/home_controller.dart';
import 'package:tash5esy_website/utils/colors.dart';
import 'package:tash5esy_website/view/widgets/lang_toggle_button.dart';
import 'package:tash5esy_website/view/widgets/login_button.dart';
import 'package:tash5esy_website/view/widgets/signup_button.dart';

class CustomAppBar extends StatelessWidget {
  final HomeController controller;
  const CustomAppBar({super.key, required this.controller});

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
          if (width > 800) _customTap(title: "Home", key: controller.homeKey),
          if (width > 800)
            _customTap(title: "Our Services", key: controller.ourServiceKey),
          if (width > 800) _customTap(title: "Pricing"),
          if (width > 800)
            _customTap(title: "About Us", key: controller.aboutUsKey),
          if (width > 800)
            _customTap(title: "Contact Us", key: controller.contactUsKey),
          if (width > 800) Spacer(),
          if (width > 1150) SignupButton(),
          if (width > 1150) LoginButton(),
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
        if (key != null) controller.scrollController(key);
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
