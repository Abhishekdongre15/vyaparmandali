import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         /* UIToolkit.ReUseTextField(
            hintText: "Enter Otp",
          ),*/
          Center(
            child: UIToolkitButtons.primaryButton(onPressed: (){}, text: "Submit Otp"),
          )
        ],
      ),
    );
  }
}
