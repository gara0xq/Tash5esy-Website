import 'package:flutter/material.dart';
import 'package:tash5esy_website/controller/home_controller.dart';
import 'package:tash5esy_website/utils/colors.dart';

class CustomAppBar extends StatelessWidget {
  final HomeController controller;
  const CustomAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 100,
      color: Color(0xffF7FCFD),
      child: Container(
        constraints: BoxConstraints(maxWidth: 1400),
        child: Row(
          spacing: 15,
          children: [
            Container(
              height: 90,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
            ),
            Spacer(),
            _customTap(title: "Home"),
            _customTap(title: "Our Services"),
            _customTap(title: "Pricing"),
            _customTap(title: "About Us"),
            _customTap(title: "Contact Us"),
            Spacer(),
            Container(
              height: 40,
              width: 110,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: foriegnColor, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Sign up",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: foriegnColor,
                ),
              ),
            ),
            Container(
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
            InkWell(
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
            ),
          ],
        ),
      ),
    );
  }
}

Widget _customTap({
  required String title,
}) {
  return InkWell(
    onTap: () {},
    radius: 12,
    hoverColor: foriegnColor,
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
