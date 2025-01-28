import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/controller/payment_controller.dart';
import 'package:tash5esy_website/model/subscription_model.dart';
import 'package:tash5esy_website/utils/colors.dart';
import 'package:tash5esy_website/view/widgets/payment_widgets/checkout.dart';
import 'package:tash5esy_website/view/widgets/payment_widgets/confirmation.dart';
import 'package:tash5esy_website/view/widgets/payment_widgets/payment.dart';

class PaymentBox extends StatelessWidget {
  PaymentBox({super.key, required this.model});
  final SubscriptionModel model;

  final List pages = [
    "summary".tr,
    "payment".tr,
    "confirmation".tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: GetBuilder<PaymentController>(
        init: PaymentController(),
        builder: (controller) {
          return Center(
            child: Container(
              height: 600,
              width: 500,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade800,
                    spreadRadius: -1,
                    blurRadius: 10,
                  )
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/mini_logo.png"),
                        InkWell(
                          onTap: () => Get.back(),
                          child: Icon(Icons.close),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pages[controller.currentIndex],
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              _pageNumber(1, pages[0], controller),
                              Expanded(child: Divider(color: Colors.grey)),
                              _pageNumber(2, pages[1], controller),
                              Expanded(child: Divider(color: Colors.grey)),
                              _pageNumber(3, pages[2], controller),
                            ],
                          ),
                          controller.currentIndex == 0
                              ? Checkout(model: model, controller: controller)
                              : controller.currentIndex == 1
                                  ? Payment(controller: controller,)
                                  : Confirmation(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _pageNumber(int number, String title, controller) {
    return Column(
      spacing: 7,
      children: [
        Container(
          height: 30,
          width: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: controller.currentIndex == number - 1
                ? foriegnColor
                : Colors.grey,
          ),
          child: Text(
            number.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: controller.currentIndex == number - 1
                ? foriegnColor
                : Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
