import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF7FCFD),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: width,
            constraints: BoxConstraints(maxWidth: 1400),
            child: Column(
              spacing: 40,
              children: [
                Container(
                  height: 100,
                  color: Colors.grey.shade300,
                ),
                Container(
                  height: 900,
                  color: Colors.grey.shade300,
                  child: Center(
                    child: Text("Hello, World!"),
                  ),
                ),
                Container(
                  height: 900,
                  color: Colors.grey.shade300,
                ),
                Container(
                  height: 900,
                  color: Colors.grey.shade300,
                ),
                Container(
                  height: 900,
                  color: Colors.grey.shade300,
                ),
                Container(
                  height: 900,
                  color: Colors.grey.shade300,
                ),
                Container(
                  height: 400,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
