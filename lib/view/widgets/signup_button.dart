import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/utils/colors.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed('/signup'),
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        height: 40,
        width: 110,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: foriegnColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          "Sign up".tr,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: foriegnColor,
          ),
        ),
      ),
    );
  }
}
