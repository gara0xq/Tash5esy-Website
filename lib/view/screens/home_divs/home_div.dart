import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/utils/colors.dart';

class HomeDiv extends StatelessWidget {
  const HomeDiv({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 850,
      constraints: BoxConstraints(maxWidth: 1400),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                AutoSizeText(
                  "home_title".tr,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 46,
                    fontWeight: FontWeight.w900,
                  ),
                  maxLines: 2,
                ),
                Text(
                  "home_text1".tr,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                ),
                Text(
                  "home_text2".tr,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                ),
              ],
            ),
          ),
          if (width > 900)
            Expanded(
              child: Image.asset(
                "assets/images/about_us.png",
                scale: 1.3,
              ),
            ),
        ],
      ),
    );
  }
}
