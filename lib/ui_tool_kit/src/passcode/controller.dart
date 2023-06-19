import 'package:flutter/material.dart';

class PasscodeController extends ChangeNotifier {
  PasscodeController({
    required this.onPasscodeEntered,
    this.passwordDigits = 6,
    this.fingerPrintEnabled = false,
    this.fingerPrintPressedCallback,
  });

  final int passwordDigits;
  bool fingerPrintEnabled;
  final focusNode = FocusNode();
  final VoidCallback? fingerPrintPressedCallback;
  final Function(String value) onPasscodeEntered;
  // late final AnimationController animationController;
  // late final Animation<double> animation;

  String? _error;
  String? get error => _error;

  String _enteredPasscode = '';
  String get enteredPasscode => _enteredPasscode;
  String confirmPasscode = '';
  bool setAnimation = false;

  void enableFingerprint() {
    fingerPrintEnabled = true;
    notifyListeners();
  }


  void setError(String error) {
    _error = error;
    setAnimation= true;
    // animationController.forward();
    notifyListeners();


    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      setAnimation= false;
      notifyListeners();
      return null;
    });

    Future.delayed(const Duration(milliseconds: 1500)).then((value) {
      _error = null;
      _enteredPasscode = '';
      notifyListeners();
      return null;
    });
  }

  void clear() {
    _enteredPasscode = '';
    notifyListeners();
  }

  void onFingerprintButtonPressed() {
    fingerPrintPressedCallback?.call();
  }

  void onDeleteCancelButtonPressed() {
    if (enteredPasscode.isNotEmpty) {
      _enteredPasscode = enteredPasscode.substring(0, enteredPasscode.length - 1);
      notifyListeners();
    }
  }

  void onKeyboardButtonPressed(String text) {
    if (enteredPasscode.length < passwordDigits) {
      _enteredPasscode += text;
      notifyListeners();
      if (enteredPasscode.length == passwordDigits) {
        onPasscodeEntered(enteredPasscode);
        // if (widget.confirmPassword.isNotEmpty) {
        //   if (widget.confirmPassword == enteredPasscode) {
        //     widget.passwordEnteredCallback(enteredPasscode);
        //   } else {
        //     setState(() {
        //       enteredPasscode = '';
        //       controller.forward();
        //       widget.isErrorStreamController.add(true);
        //     });
        //   }
        // } else {
        //   widget.passwordEnteredCallback(enteredPasscode);
        // }
        // resetError();
      }
    }
    focusNode.requestFocus();
  }
}
