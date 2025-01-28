import 'package:flutter/material.dart';
import 'package:tash5esy_website/controller/main_controller.dart';
import 'package:tash5esy_website/utils/colors.dart';

class LangToggleButton extends StatelessWidget {
  const LangToggleButton({super.key, required this.controller});
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeLang();
      },
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        height: 40,
        width: 80,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: controller.currentLang == Lang.EN
              ? TextDirection.rtl
              : TextDirection.ltr,
          children: [
            SizedBox(),
            Text(
              controller.currentLang == Lang.EN ? "EN" : "AR",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: primaryColor,
              ),
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.language_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
