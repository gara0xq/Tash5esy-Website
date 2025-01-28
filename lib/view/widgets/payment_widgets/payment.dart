import 'package:flutter/material.dart';
import 'package:tash5esy_website/controller/payment_controller.dart';
import 'package:tash5esy_website/utils/colors.dart';

class Payment extends StatelessWidget {
  const Payment({super.key, required this.controller});
  final PaymentController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _paymentTypeBox("paypal.png"),
            _paymentTypeBox("mastercard.png"),
            _paymentTypeBox("apple_pay.png"),
          ],
        ),
        
        _textInput(Icons.person, "Name on card", null),
        _textInput(Icons.credit_card, "Card number", null),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child:
                  _textInput(Icons.calendar_month_rounded, "Expire Date", null),
            ),
            Expanded(
              child: _textInput(Icons.lock, "CVV", null),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            controller.continuePayment(2);
          },
          child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: foriegnColor,
            ),
            child: const Text(
              "Pay Now",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _paymentTypeBox(String image) {
    return Container(
      height: 60,
      width: 60,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: -1,
            blurRadius: 7,
          ),
        ],
        color: Colors.white,
      ),
      child: Image.asset('assets/images/$image'),
    );
  }

  Widget _textInput(
      IconData icon, String hint, String? Function(String?)? validator) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
