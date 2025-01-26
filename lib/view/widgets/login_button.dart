import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/utils/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Get.toNamed('/login'),
        hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
      child: Container(
                height: 40,
                width: 110,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: foriegnColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
    );
  }
}