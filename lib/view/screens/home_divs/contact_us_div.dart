import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tash5esy_website/controller/main_controller.dart';
import 'package:tash5esy_website/utils/colors.dart';

class ContactUsDiv extends StatelessWidget {
  const ContactUsDiv({super.key, required this.controller});
  final MainController controller;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 400,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(maxWidth: 1400),
      child: SizedBox(
        height: 170,
        child: Row(
          spacing: 20,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/logo.png"),
                  _subText("Online"),
                  _subText("Call: (321) 428 321 3902"),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300),
                          child: Image.asset("assets/icons/twitter.png"),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300),
                          child: Image.asset("assets/icons/facebook.png"),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade300,
                          ),
                          child: Image.asset("assets/icons/linkedin.png"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            if (width > 900)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 7,
                  children: [
                    _mainText("Explore"),
                    _subText(
                      "Services",
                      key: controller.ourServiceKey,
                    ),
                    _subText(
                      "Pricing",
                    ),
                    _subText(
                      "About Us",
                      key: controller.aboutUsKey,
                    ),
                  ],
                ),
              ),
            if (width > 699)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 7,
                  children: [
                    _mainText("Legal"),
                    _subText(
                      "Privacy Policy",
                    ),
                    _subText(
                      "Terms of Services",
                    ),
                    _subText(
                      "Documentations",
                    ),
                    _subText(
                      "Help Center",
                    ),
                  ],
                ),
              ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 7,
                children: [
                  _mainText("Subscripe"),
                  _subText(
                    "Subscribe to get the latest news from us",
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.only(right: width / 19),
                    padding: EdgeInsets.only(left: 20, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Your Email",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: foriegnColor,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: AutoSizeText(
                              "Subscripe",
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainText(String title) {
    return AutoSizeText(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
      maxLines: 1,
    );
  }

  Widget _subText(String title, {void Function()? onTap, GlobalKey? key}) {
    return GestureDetector(
      onTap: key != null ? () => controller.scrollController(key) : onTap,
      child: AutoSizeText(
        title,
        style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        maxLines: 1,
      ),
    );
  }
}
