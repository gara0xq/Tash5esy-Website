import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/utils/colors.dart';

class SubscriptionDiv extends StatelessWidget {
  SubscriptionDiv({super.key});
  final List<Map<String, String>> subscription = [
    {
      "title": "sub_title1".tr,
      "description": "sub_text1".tr,
      "image": "assets/images/sub1.png",
    },
    {
      "title": "sub_title2".tr,
      "description": "sub_text2".tr,
      "image": "assets/images/sub2.png",
    },
    {
      "title": "sub_title3".tr,
      "description": "sub_text3".tr,
      "image": "assets/images/sub3.png",
    },
    {
      "title": "sub_title4".tr,
      "description": "sub_text4".tr,
      "image": "assets/images/sub4.png",
    },
    {
      "title": "sub_title5".tr,
      "description": "sub_text5".tr,
      "image": "assets/images/sub5.png",
    },
    {
      "title": "sub_title6".tr,
      "description": "sub_text6".tr,
      "image": "assets/images/sub6.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(maxWidth: 1400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "subscription_title".tr,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 46,
                        fontWeight: FontWeight.w900,
                      ),
                      maxLines: 2,
                    ),
                    AutoSizeText(
                      "subscription_subtitle".tr,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Container(
                  width: width / 10,
                  constraints: BoxConstraints(minWidth: 150),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: primaryColor, width: 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          "Subscribe Now",
                          style: TextStyle(
                            fontSize: 18,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_sharp,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: subscription.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 700,
              childAspectRatio: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (_, i) {
              return _subscriptionBox(
                image: subscription[i]["image"]!,
                title: subscription[i]["title"]!,
                description: subscription[i]["description"]!,
                width: width / 21,
              );
            },
          )
        ],
      ),
    );
  }
}

Widget _subscriptionBox({
  required String title,
  required String description,
  required String image,
  double width = 300,
}) {
  return Center(
    child: Container(
      height: 200,
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
      child: Row(
        spacing: 20,
        children: [
          Container(
            height: width,
            width: width,
            constraints: BoxConstraints(
              maxWidth: 120,
              maxHeight: 120,
              minHeight: 80,
              minWidth: 80,
            ),
            padding: EdgeInsets.all(7),
            child: Image.asset(image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
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
        ],
      ),
    ),
  );
}
