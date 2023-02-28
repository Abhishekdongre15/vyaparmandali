
import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/extension/valid_password.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';

class PasswordField<T> extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;

  const PasswordField(
      {super.key,
      this.controller,
      this.labelText,
      this.hintText,
      this.validator});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisible = true;
  bool get passwordVisible => _passwordVisible;
  set passwordVisible(bool val) {
    _passwordVisible = val;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          obscureText: passwordVisible,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            contentPadding: !Responsive.isSmallScreen(context)?  const EdgeInsets.all(20): null,
            labelText: widget.labelText,
            hintText: widget.hintText,
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 40,
              minHeight: 20,
              maxWidth: 40,
              minWidth: 40,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                passwordVisible = !passwordVisible;
              },
              icon: Icon(
                passwordVisible ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          validator: widget.validator ??
              (String? val) {
                if (val == null || val.trim().isEmpty) {
                  return "Required field";
                } else if (!val.isValidPassword()) {
                  return "Please enter valid password";
                } else {
                  return null;
                }
              },
        ),

      ],
    );
  }
}
