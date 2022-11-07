import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
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
         /* UIToolkit.ReUseTextField(
            hintText: "Enter Otp",
          ),*/
          UIToolkitButtons.primaryButton(onPressed: (){}, text: "Submit Otp")
        ],
      ),
    );
  }
}
