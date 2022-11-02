import 'package:flutter/material.dart';
import 'package:reusekit/reusekit.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReUseTextField(
            hintText: "Enter Otp",
          ),
          ReUseButton(onPressed: (){}, title: "Submit Otp")
        ],
      ),
    );
  }
}
