import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/controller/subscription_controller.dart';
import 'package:tash5esy_website/utils/colors.dart';
import 'package:tash5esy_website/view/widgets/custom_appbar.dart';
import 'package:tash5esy_website/view/widgets/custom_drawer.dart';
import 'package:tash5esy_website/view/widgets/subscription_card.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<SubscriptionController>(
      init: SubscriptionController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xffF7FCFD),
          appBar: AppBar(
            backgroundColor: Color(0xffF7FCFD),
            centerTitle: true,
            surfaceTintColor: Colors.transparent,
            title: CustomAppBar(controller: controller),
          ),
          drawer: width < 1150
              ? CustomDrawer(
                  controller: controller,
                )
              : null,
          body: SingleChildScrollView(
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                AutoSizeText(
                  "choose_your_plan".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 46,
                    fontWeight: FontWeight.w900,
                  ),
                  maxLines: 1,
                ),
                Center(
                  child: Container(
                    width: 400,
                    height: 50,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffD3E7F0),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "monthly".tr,
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "yearly".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AutoSizeText(
                  "best_plans".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ),
                controller.fetching.value
                    ? Center(child: CircularProgressIndicator())
                    : width > 1150
                        ? Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SubscriptionCard(
                                model: controller.subscriptions[2],
                              ),
                              SubscriptionCard(
                                model: controller.subscriptions[1],
                              ),
                              SubscriptionCard(
                                model: controller.subscriptions[0],
                              ),
                            ],
                          )
                        : SizedBox(
                            height: 570,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                  height: 570,
                                  enableInfiniteScroll: false,
                                  initialPage: 1,
                                  viewportFraction: 1),
                              items: [
                                SubscriptionCard(
                                  model: controller.subscriptions[2],
                                ),
                                SubscriptionCard(
                                  model: controller.subscriptions[1],
                                ),
                                SubscriptionCard(
                                  model: controller.subscriptions[0],
                                ),
                              ],
                            ),
                          ),
              ],
            ),
          ),
        );
      },
    );
  }
}
