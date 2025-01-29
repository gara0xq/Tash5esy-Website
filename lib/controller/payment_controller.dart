import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/model/subscription_model.dart';

class PaymentController extends GetxController {
  int currentIndex = 0;
  bool isCouponApplied = false;
  TextEditingController couponController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameOnCardController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController dateExpiredController = TextEditingController();

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
    if (value == 2) {
      if (formKey.currentState!.validate()) {
        currentIndex = value;
      }
    } else {
      currentIndex = value;
    }
    update();
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return "Invalid name format";
    }
    return null;
  }

  String? validateCardNumber(String? value) {
    if (value == null ||
        value.length != 16 ||
        !RegExp(r"^\d{16}$").hasMatch(value)) {
      return "Visa number must be 16 digits";
    }
    return null;
  }

  String? validateCVV(String? value) {
    if (value == null || !RegExp(r"^\d{3,4}$").hasMatch(value)) {
      return "CVV must be 3 or 4 digits";
    }
    return null;
  }

  String? validateExpireDate(String? value) {
    if (value == null || !RegExp(r"^(0[1-9]|1[0-2])\/\d{2}$").hasMatch(value)) {
      return "Invalid date format (MM/YY)";
    }

    // Check if date is expired
    List<String> parts = value.split('/');
    int month = int.parse(parts[0]);
    int year = int.parse(parts[1]) + 2000; // Convert YY to YYYY

    DateTime now = DateTime.now();
    DateTime expiryDate = DateTime(year, month + 1); // End of month

    if (expiryDate.isBefore(now)) {
      return "Card is expired";
    }

    return null;
  }
}
