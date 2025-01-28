import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/controller/payment_controller.dart';
import 'package:tash5esy_website/model/subscription_model.dart';
import 'package:tash5esy_website/utils/colors.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key, required this.model, required this.controller});
  final SubscriptionModel model;
  final PaymentController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Container(
          height: 60,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: -1,
                blurRadius: 7,
              ),
            ],
          ),
          child: Row(
            spacing: 10,
            children: [
              Image.asset('assets/images/plan.png'),
              Text(
                "${model.planeType.name} Plan",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                "${model.price}EGP",
                style: TextStyle(
                  color: foriegnColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        _coupon(controller),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "subtotal".tr,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "${model.price} EGP",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "discount".tr,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              controller.isCouponApplied
                  ? "${(model.price * (model.discount / 100)).toInt()} EGP"
                  : "0 EGP",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "total".tr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              controller.isCouponApplied
                  ? "${model.price - ((model.price * (model.discount / 100)).toInt())} EGP"
                  : "${model.price} EGP",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            controller.continuePayment(1);
          },
          child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: foriegnColor,
            ),
            child: Text(
              "proceed".tr,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _coupon(controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                if (controller.isCouponApplied)
                  Chip(
                    elevation: 0,
                    label: Text("${model.discount}% OFF"),
                    avatar:
                        Icon(Icons.sell_rounded, size: 16, color: Colors.black),
                    deleteIcon: Icon(Icons.close, size: 16, color: Colors.grey),
                    onDeleted: () {
                      controller.deleteCoupon();
                    },
                    backgroundColor: Color(0xffDFECF5),
                  )
                else
                  Expanded(
                    child: Form(
                      key: controller.formKey,
                      child: TextFormField(
                        controller: controller.couponController,
                        validator: (value) =>
                            controller.validateCoupon(model, value),
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: "enter_coupon".tr,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          child: Container(
            height: 45,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: foriegnColor,
              borderRadius: BorderRadius.circular(7),
            ),
            child:  Text(
              "apply".tr,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () {
            controller.addCoupon();
          },
        ),
      ],
    );
  }
}
