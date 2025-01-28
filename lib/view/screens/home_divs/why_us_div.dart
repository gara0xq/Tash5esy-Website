import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/utils/colors.dart';

class WhyUsDiv extends StatelessWidget {
  WhyUsDiv({super.key});
  final List<Map<String, String>> whyUs = [
    {
      "title": "why_title1".tr,
      "description": "why_text1".tr,
      "image": "assets/icons/whyus1.png",
    },
    {
      "title": "why_title2".tr,
      "description": "why_text2".tr,
      "image": "assets/icons/whyus2.png",
    },
    {
      "title": "why_title3".tr,
      "description": "why_text3".tr,
      "image": "assets/icons/whyus3.png",
    },
    {
      "title": "why_title4".tr,
      "description": "why_text4".tr,
      "image": "assets/icons/whyus4.png",
    },
    {
      "title": "why_title5".tr,
      "description": "why_text5".tr,
      "image": "assets/icons/whyus5.png",
    },
    {
      "title": "why_title6".tr,
      "description": "why_text6".tr,
      "image": "assets/icons/whyus6.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      color: Color(0xffCF7D4E).withOpacity(0.05),
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: 1400),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 80,
          children: [
            Text(
              "Why Us".tr,
              style: TextStyle(
                color: primaryColor,
                fontSize: 46,
                fontWeight: FontWeight.w900,
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: whyUs.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 460,
                childAspectRatio: 1.4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (_, i) {
                return _whyUsBox(
                  image: whyUs[i]["image"]!,
                  title: whyUs[i]["title"]!,
                  description: whyUs[i]["description"]!,
                  width: width / 21,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget _whyUsBox({
  required String title,
  required String description,
  required String image,
  double width = 300,
}) {
  return Center(
    child: Container(
      height: 300,
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300, spreadRadius: -1, blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Container(
            height: width,
            width: width,
            constraints: BoxConstraints(
              maxWidth: 90,
              maxHeight: 90,
              minHeight: 50,
              minWidth: 50,
            ),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffECF1FF),
            ),
            child: Image.asset(image),
          ),
          AutoSizeText(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
          ),
          AutoSizeText(
            description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
          ),
        ],
      ),
    ),
  );
}
