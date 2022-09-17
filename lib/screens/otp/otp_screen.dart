import 'package:flutter/material.dart';
import 'package:food_delivery/size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "OTP Verification",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
