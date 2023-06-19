import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

class BulletPoint extends StatefulWidget {
  const BulletPoint(
      {Key? key,
      required this.password,
      required this.streamController,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.dob,
      required this.isOverlayShow,
      required this.text})
      : super(key: key);
  final TextEditingController password;
  final StreamController streamController;
  final String firstName;
  final String lastName;
  final String email;
  final String dob;
  final bool isOverlayShow;
  final String text;

  @override
  _BulletPointState createState() => _BulletPointState();
}

class _BulletPointState extends State<BulletPoint> {
  bool isSpecialChar = false;
  bool isMinChar = false;
  bool isAtLeastOneNumber = false;
  bool isValidateConsecutiveSeq = false;
  bool isFirstNameValid = false;
  bool isLastNameValid = false;
  bool isEmailValid = false;
  bool isDobValid = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    validateMyInput(widget.text);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2), // if you need this
        side: BorderSide(
          color: Colors.grey.withOpacity(0.04),
          width: 1,
        ),
      ),
      shadowColor: Colors.grey.withOpacity(0.4),
      elevation: 1.8,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Your new security password must have:',
                style: ToolkitTypography.cap1A
                    .copyWith(color: ToolkitColors.primaryDarkText),
              ),
            ),
            const SizedBox(height: 8),
            validationRow(
                isAtLeastOneNumber
                    ? ToolkitAssets.iconCheck
                    : ToolkitAssets.iconClose,
                'At least one number'),
            validationRow(
                isSpecialChar
                    ? ToolkitAssets.iconCheck
                    : ToolkitAssets.iconClose,
                'At least one special character'),
            validationRow(
                isMinChar ? ToolkitAssets.iconCheck : ToolkitAssets.iconClose,
                'A minimum of 8 characters in length'),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Your password must not:',
                style: ToolkitTypography.cap1A
                    .copyWith(color: ToolkitColors.primaryDarkText),
              ),
            ),
            const SizedBox(height: 8),
            if (!isFirstNameValid &&
                !isLastNameValid &&
                !isEmailValid &&
                !isDobValid)
              validationRow(ToolkitAssets.iconCheck,
                  'Be your first name, last name, email address, or date of birth')
            else
              validationRow(ToolkitAssets.iconClose,
                  'Be your first name, last name, email address,\n or date of birth'),
            validationRow(
                !isValidateConsecutiveSeq
                    ? ToolkitAssets.iconCheck
                    : ToolkitAssets.iconClose,
                'Have more than 2 sequential characters'),
          ],
        ),
      ),
    );
  }

  Widget validationRow(ToolkitAssets assets, String title) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 8, top: 8),
        child: assets.widget(height: 16, width: 16),
      ),
      Flexible(
        child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            title,
            style: ToolkitTypography.cap1B,
          ),
        ),
      ),
    ]);
  }

  void validateMyInput(String value) {
    var previousValue = isMinChar;
    var previousValueIsSpecialChar = isSpecialChar;
    var previousValueIsAtLeastOneNumber = isAtLeastOneNumber;
    var previousValueIsValidateConsecutiveSeq = isValidateConsecutiveSeq;
    var previousValueIsFirstName = isFirstNameValid;
    var previousValueIsLastName = isLastNameValid;
    var previousValueIsEmail = isEmailValid;
    var previousValueIsDob = isDobValid;
    isMinChar = Validator().hasMinLength(value, 8);
    //String uperCasePattern = '^(.*?[A-Z]){' + '1' + ',}';
    isAtLeastOneNumber = Validator().hasMinNumericChar(value, 1);
    isSpecialChar = Validator().hasMinSpecialChar(value, 1);
    isValidateConsecutiveSeq = Validator().validateConsecutiveSeq(value);
    isFirstNameValid = Validator().hasFirstName(value, widget.firstName);
    isLastNameValid = Validator().hasFirstName(value, widget.lastName);
    isEmailValid = Validator().hasFirstName(value, widget.email);
    isDobValid = Validator().hasFirstName(value, widget.dob);
    if (previousValue != isMinChar) {
      if (isMinChar &&
          isAtLeastOneNumber &&
          isSpecialChar &&
          !isValidateConsecutiveSeq &&
          !isFirstNameValid &&
          !isLastNameValid &&
          !isEmailValid &&
          !isDobValid) {
        widget.streamController.add(true);
      } else {
        widget.streamController.add(false);
      }
    } else if (previousValueIsSpecialChar != isSpecialChar) {
      if (isMinChar &&
          isAtLeastOneNumber &&
          isSpecialChar &&
          !isValidateConsecutiveSeq &&
          !isFirstNameValid &&
          !isLastNameValid &&
          !isEmailValid &&
          !isDobValid) {
        widget.streamController.add(true);
      } else {
        widget.streamController.add(false);
      }
    } else if (previousValueIsAtLeastOneNumber != isAtLeastOneNumber) {
      if (isMinChar &&
          isAtLeastOneNumber &&
          isAtLeastOneNumber &&
          !isValidateConsecutiveSeq &&
          !isFirstNameValid &&
          !isLastNameValid &&
          !isEmailValid &&
          !isDobValid) {
        widget.streamController.add(true);
      } else {
        widget.streamController.add(false);
      }
    } else if (previousValueIsValidateConsecutiveSeq !=
        isValidateConsecutiveSeq) {
      if (isMinChar &&
          isAtLeastOneNumber &&
          isAtLeastOneNumber &&
          !isValidateConsecutiveSeq &&
          !isFirstNameValid &&
          !isLastNameValid &&
          !isEmailValid &&
          !isDobValid) {
        widget.streamController.add(true);
      } else {
        widget.streamController.add(false);
      }
    } else if (previousValueIsFirstName != isFirstNameValid) {
      if (isMinChar &&
          isAtLeastOneNumber &&
          isAtLeastOneNumber &&
          !isValidateConsecutiveSeq &&
          !isFirstNameValid &&
          !isLastNameValid &&
          !isEmailValid &&
          !isDobValid) {
        widget.streamController.add(true);
      } else {
        widget.streamController.add(false);
      }
    } else if (previousValueIsLastName != isLastNameValid) {
      if (isMinChar &&
          isAtLeastOneNumber &&
          isAtLeastOneNumber &&
          !isValidateConsecutiveSeq &&
          !isFirstNameValid &&
          !isLastNameValid &&
          !isEmailValid &&
          !isDobValid) {
        widget.streamController.add(true);
      } else {
        widget.streamController.add(false);
      }
    } else if (previousValueIsEmail != isEmailValid) {
      if (isMinChar &&
          isAtLeastOneNumber &&
          isAtLeastOneNumber &&
          !isValidateConsecutiveSeq &&
          !isFirstNameValid &&
          !isLastNameValid &&
          !isEmailValid &&
          !isDobValid) {
        widget.streamController.add(true);
      } else {
        widget.streamController.add(false);
      }
    } else if (previousValueIsDob != isDobValid) {
      if (isMinChar &&
          isAtLeastOneNumber &&
          isAtLeastOneNumber &&
          !isValidateConsecutiveSeq &&
          !isFirstNameValid &&
          !isLastNameValid &&
          !isEmailValid &&
          !isDobValid) {
        widget.streamController.add(true);
      } else {
        widget.streamController.add(false);
      }
    }
  }
}

class Validator {
  /// Checks if password has minLength
  bool hasMinLength(String password, int minLength) {
    return password.length >= minLength ? true : false;
  }

  /// Checks if password has at least uppercaseCount uppercase letter matches
  bool hasMinUppercase(String password, int uppercaseCount) {
    String pattern = '^(.*?[A-Z]){' + uppercaseCount.toString() + ',}';
    return password.contains(RegExp(pattern));
  }

  /// Checks if password has at least numericCount numeric character matches
  bool hasMinNumericChar(String password, int numericCount) {
    String pattern = '^(.*?[0-9]){' + numericCount.toString() + ',}';
    return password.contains(RegExp(pattern));
  }

  //Checks if password has at least specialCount special character matches
  bool hasMinSpecialChar(String password, int specialCount) {
    String pattern =
        r"^(.*?[$&+,\:;/=?@#|'<>.^*()_%!-]){" + specialCount.toString() + ",}";
    return password.contains(RegExp(pattern));
  }

  bool hasFirstName(String password, String firstName) {
    if (firstName.isNotEmpty &&
        password.toLowerCase().contains(firstName.toLowerCase())) {
      return true;
    }
    return false;
  }

  bool hasLastName(String password, String lastName) {
    if (lastName.isNotEmpty &&
        password.toLowerCase().contains(lastName.toLowerCase())) {
      return true;
    }
    return false;
  }

  bool hasEmail(String password, String email) {
    if (email.isNotEmpty &&
        password.toLowerCase().contains(email.toLowerCase())) {
      return true;
    }
    return false;
  }

  bool hasDob(String password, String dob) {
    // if (password.contains(getPartyDob('ddMMyyyy', dob)) ||
    //     password.contains(getPartyDob('ddMMyy', dob)) ||
    //     password.contains(getPartyDob('dd-MM-yyyy', dob)) ||
    //     password.contains(getPartyDob('dd/MM/yyyy', dob)) ||
    //     password.contains(getPartyDob('dd-MM-yy', dob)) ||
    //     password.contains(getPartyDob('dd/MM/yy', dob))) {
    //   return true;
    // }
    return false;
  }

  String getPartyDob(String format, String birthDate) {
    final DateTime tempDate = DateFormat('yyyy-MM-dd').parse(birthDate);
    final String date = DateFormat(format).format(tempDate);
    return date;
  }

  bool validateConsecutiveSeq(String password) {
    final List<int> epinCharArray = <int>[];
    for (final int rune in password.toLowerCase().runes) {
      epinCharArray.add(rune);
      final String character = String.fromCharCode(rune);
    }
    int asciiCode = 0;
    bool isConSeq = false;
    int previousAsciiCode = 0;
    int numSeqcount = 0;

    for (int i = 0; i < epinCharArray.length; i++) {
      asciiCode = epinCharArray[i];
      if ((previousAsciiCode + 1) == asciiCode) {
        numSeqcount++;
        if (numSeqcount >= 2) {
          isConSeq = true;
          break;
        }
      } else {
        numSeqcount = 0;
      }
      previousAsciiCode = asciiCode;
    }
    return isConSeq;
  }
}
