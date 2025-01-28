import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/model/subscription_model.dart';

class PaymentController extends GetxController {
  int currentIndex = 0;
  bool isCouponApplied = false;
  TextEditingController couponController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  validateCoupon(SubscriptionModel model, value) {
    if (model.coupon == value) {
      return null;
    }
    return "Invalid Coupon";
  }

  addCoupon() {
    if (formKey.currentState!.validate()) {
      isCouponApplied = true;
      update();
    }
  }

  deleteCoupon() {
    couponController.clear();
    isCouponApplied = false;
    update();
  }

  continuePayment(value) {
    currentIndex = value;
    update();
  }
}
