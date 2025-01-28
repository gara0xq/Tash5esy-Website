import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/utils/colors.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        spacing: 10,
        children: [
          Image.asset("assets/images/successfull.png"),
          Text(
            "pay_success".tr,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "pay_success_text".tr,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          InkWell(
            onTap: () {
              Get.offAllNamed('/');
            },
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Container(
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: primaryColor,
              ),
              child: Text("continue".tr, style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
