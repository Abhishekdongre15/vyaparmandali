import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({
    Key? key,
    required this.onDobEnteredCallBack,
    required this.validDateCallBack,
    required this.isEmptyDateMsg,
    required this.inValidDateMsg,
    required this.youAreUnder18Msg,
    required this.setError,
    this.initialDate,
  }) : super(key: key);

  final Function(DateTime date) onDobEnteredCallBack;
  final Function(bool date) validDateCallBack;
  final String isEmptyDateMsg;
  final String inValidDateMsg;
  final String youAreUnder18Msg;
  final bool setError;
  final DateTime? initialDate;

  @override
  _DobState createState() => _DobState();
}

class _DobState extends State<DateWidget> {
  TextEditingController mmController = TextEditingController();
  TextEditingController ddController = TextEditingController();
  TextEditingController yyyyController = TextEditingController();
  String finalDate = '';
  bool isValidDate = true;

  late String errorMsg;

  @override
  void initState() {
    // TODO: implement initState
    errorMsg = widget.inValidDateMsg;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  autofocus: true,
                  controller: ddController,
                  textAlign: TextAlign.center,
                  style: ToolkitTypography.body1B
                      .copyWith(color: ToolkitColors.primaryDarkText),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                  onEditingComplete: () {
                    ddController.text = ddController.text.padLeft(2, '0');
                  },
                  cursorColor: ToolkitColors.formCursor,
                  cursorWidth: 1,
                  cursorHeight: 24,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  onChanged: (value) {
                    if (value.length == 2) {
                      FocusScope.of(context).nextFocus();
                    }
                    checkDob();
                  },
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: isValidDate
                              ? ToolkitColors.secondaryDarkText
                              : ToolkitColors.error),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: isValidDate
                              ? ToolkitColors.primaryDarkText
                              : ToolkitColors.error),
                    ),
                    hintText: 'DD',
                  ),
                ),
              ),
              Container(
                width: 40,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: mmController,
                  textAlign: TextAlign.center,
                  style: ToolkitTypography.body1B
                      .copyWith(color: ToolkitColors.primaryDarkText),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                  cursorColor: ToolkitColors.formCursor,
                  cursorWidth: 1,
                  cursorHeight: 24,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  onEditingComplete: () {
                    mmController.text = mmController.text.padLeft(2, '0');
                  },
                  onChanged: (value) {
                    if (value.length == 2) {
                      FocusScope.of(context).nextFocus();
                    }
                    checkDob();
                  },
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: isValidDate
                              ? ToolkitColors.secondaryDarkText
                              : ToolkitColors.error),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: isValidDate
                              ? ToolkitColors.primaryDarkText
                              : ToolkitColors.error),
                    ),
                    hintText: 'MM',
                  ),
                ),
              ),
              Container(
                width: 50,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: yyyyController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    // CustomRangeTextInputFormatter(
                    //     min: DateTime.now().year - 90,
                    //     max: DateTime.now().year,
                    //     matchLength: true),
                  ],
                  style: ToolkitTypography.body1B
                      .copyWith(color: ToolkitColors.primaryDarkText),
                  cursorColor: ToolkitColors.formCursor,
                  cursorWidth: 1,
                  cursorHeight: 24,
                  onSubmitted: (value) {
                    checkDob();
                  },
                  onChanged: (value) {
                    if (value.length == 4) {
                      FocusScope.of(context).nextFocus();
                      checkDob();
                    }

                  },
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: isValidDate
                              ? ToolkitColors.secondaryDarkText
                              : ToolkitColors.error),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: isValidDate
                              ? ToolkitColors.primaryDarkText
                              : ToolkitColors.error),
                    ),
                    hintText: 'YYYY',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          (widget.setError &&
                  (widget.setError && mmController.text.isEmpty ||
                      ddController.text.isEmpty ||
                      yyyyController.text.isEmpty))
              ? Text(
                  widget.inValidDateMsg,
                  style: ToolkitTypography.verySmallB
                      .copyWith(color: ToolkitColors.error),
                )
              : isValidDate
                  ? const SizedBox()
                  : Text(
                      errorMsg,
                      style: ToolkitTypography.verySmallB
                          .copyWith(color: ToolkitColors.error),
                    ),
        ],
      ),
    );
  }

  bool dateValid(String input) {
    try {
      String yyyy = yyyyController.text;
      String mm = mmController.text.length == 1
          ? '0${mmController.text}'
          : mmController.text;
      String dd = ddController.text.length == 1
          ? '0${ddController.text}'
          : ddController.text;

      final originalFormatString = '$yyyy-$mm-$dd';
      return input.contains(originalFormatString);
    } catch (e) {
      return false;
    }
  }

  void checkDob() {
    try {
      if (mmController.text.isEmpty ||
          ddController.text.isEmpty ||
          yyyyController.text.isEmpty) {
        setState(() {
          isValidDate = true;
        });
        widget.validDateCallBack(false);
      } else {
        if (mmController.text.isNotEmpty &&
            ddController.text.isNotEmpty &&
            yyyyController.text.length == 4) {
          String yyyy = yyyyController.text;
          String mm = mmController.text.length == 1
              ? '0${mmController.text}'
              : mmController.text;
          String dd = ddController.text.length == 1
              ? '0${ddController.text}'
              : ddController.text;
          finalDate = '$yyyy-$mm-$dd';
          DateTime _date = DateTime.parse('$yyyy-$mm-$dd');

          if (!dateValid(_date.toString())) {
            setState(() {
              isValidDate = false;
              errorMsg = widget.inValidDateMsg;
              widget.validDateCallBack(false);
            });
          } else if (isAdult(_date)) {
            widget.onDobEnteredCallBack(_date);
            widget.validDateCallBack(true);
            setState(() {
              isValidDate = true;
              errorMsg = widget.inValidDateMsg;
            });
          } else {
            setState(() {
              isValidDate = false;
              errorMsg = widget.youAreUnder18Msg;
              widget.validDateCallBack(false);
            });
          }
        } else {
          setState(() {
            isValidDate = false;
          });
          widget.validDateCallBack(false);
        }
      }
    } on Exception catch (e) {
      setState(() {
        isValidDate = false;
        errorMsg = widget.inValidDateMsg;
        widget.validDateCallBack(false);
      });
    }
  }
}

bool isAdult(DateTime date) {
  DateTime dateNow = DateTime.now();
  Duration diff = dateNow.difference(date);
  return (diff.inDays ~/ 365) > 18;
}
