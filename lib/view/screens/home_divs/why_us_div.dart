import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tash5esy_website/utils/colors.dart';

class WhyUsDiv extends StatelessWidget {
  WhyUsDiv({super.key});
  final List<Map<String, String>> whyUs = [
    {
      "title": "Comprehensive Solutions",
      "description":
          "Manage all your medical operations in one place, from patient records to lab results and x-rays.",
      "image": "assets/icons/whyus1.png",
    },
    {
      "title": "Real-Time Connectivity",
      "description":
          "A dashboard for doctors and lab technicians keeps everyone connected, ensuring accurate and instant updates.",
      "image": "assets/icons/whyus2.png",
    },
    {
      "title": "Data Security",
      "description":
          "Your data is protected with advanced encryption, ensuring patient confidentiality and trust.",
      "image": "assets/icons/whyus3.png",
    },
    {
      "title": "User-Friendly Interface",
      "description":
          "Our platform is designed with simplicity in mind, making it easy to use for professionals and patients alike.",
      "image": "assets/icons/whyus4.png",
    },
    {
      "title": "Scalability",
      "description":
          "Tash5esy grows with you, offering packages tailored to different operation sizes, users, and data needs.",
      "image": "assets/icons/whyus5.png",
    },
    {
      "title": "Support & Training",
      "description":
          "We provide 24/7 support and training sessions to ensure you get the most out of Tash5esy.",
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
              "Why Us",
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
