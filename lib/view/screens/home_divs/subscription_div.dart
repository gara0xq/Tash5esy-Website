import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tash5esy_website/utils/colors.dart';

class SubscriptionDiv extends StatelessWidget {
  SubscriptionDiv({super.key});
  final List<Map<String, String>> subscription = [
    {
      "title": "No Upfront Cost",
      "description":
          "Start using Tash5esy without heavy investments. Pay only for what you use.",
      "image": "assets/icons/whyus1.png",
    },
    {
      "title": "Comprehensive Access",
      "description": "Enjoy access to our full suite of features.",
      "image": "assets/icons/whyus2.png",
    },
    {
      "title": "Tailored to Your Needs",
      "description":
          "Choose from a range of packages designed for different operations, user numbers, and data requirements.",
      "image": "assets/icons/whyus3.png",
    },
    {
      "title": "Affordable Pricing",
      "description":
          "Transparent and competitive subscription plans designed to suit every budget.",
      "image": "assets/icons/whyus4.png",
    },
    {
      "title": "Effortless Scalability",
      "description":
          "Upgrade or downgrade your subscription anytime as your organization grows or changes.",
      "image": "assets/icons/whyus5.png",
    },
    {
      "title": "Continuous Support",
      "description":
          "Stay worry-free with 24/7 technical support and regular updates to keep your system running smoothly.",
      "image": "assets/icons/whyus6.png",
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
                      "Get Tash5esy by Subscription",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 46,
                        fontWeight: FontWeight.w900,
                      ),
                      maxLines: 2,
                    ),
                    AutoSizeText(
                      "Simplify healthcare management with our flexible subscription model!",
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
