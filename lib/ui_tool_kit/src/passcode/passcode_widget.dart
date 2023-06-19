library passcode_screen;

import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/passcode/circle.dart';
import 'package:vyaparmandali/ui_tool_kit/src/passcode/keyboard.dart';
import 'package:vyaparmandali/ui_tool_kit/src/passcode/qovarian_theme.dart';
import 'package:vyaparmandali/ui_tool_kit/src/passcode/shake_curve.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';


import 'controller.dart';

class PasscodeWidget extends StatefulWidget {
  const PasscodeWidget({
    Key? key,
    this.subTitle,
    required this.header,
    required this.controller,
  }) : super(key: key);

  final String? subTitle;
  final String header;
  final PasscodeController controller;

  @override
  State<StatefulWidget> createState() => _PasscodeWidgetState();
}

class _PasscodeWidgetState extends State<PasscodeWidget>
    with SingleTickerProviderStateMixin {
  Widget _buildTitle(PasscodeController provider) {
    if (provider.error != null) {
      return Semantics(
        header: true,
        focusable: true,
        focused: provider.focusNode.hasFocus,
        child: Focus(
          autofocus: true,
          focusNode: provider.focusNode,
          child: Text(
            provider.error!,
            textAlign: TextAlign.center,
            style: ToolkitTypography.h2.copyWith(
              color: ToolkitColors.error,
            ),
          ),
        ),
      );
    }

    return Semantics(
      header: true,
      focusable: true,
      focused: provider.focusNode.hasFocus,
      child: Text(
        widget.header,
        textAlign: TextAlign.center,
        style: ToolkitTypography.h2.copyWith(
          color: ToolkitColors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PasscodeController>.value(
      value: widget.controller,
      child: Consumer<PasscodeController>(builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ToolkitColors.white,
          body: FocusScope(
            autofocus: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                _buildTitle(provider),
                if (widget.subTitle != null)
                  Semantics(
                    header: true,
                    focused: true,
                    focusable: true,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        widget.subTitle!,
                        textAlign: TextAlign.center,
                        style: ToolkitTypography.body2B.copyWith(
                          color: ToolkitColors.secondaryDarkText,
                        ),
                      ),
                    ),
                  ),
                const Spacer(flex: 5),
                ShakeWidget(
                    shakeConstant: ShakeVerticalConstant1(),
                    duration: const Duration(milliseconds: 200),
                    autoPlay: widget.controller.setAnimation,
                    child: const PasscodeCircle(extraSize: 10)),
                const SizedBox(height: 56),
                ShakeWidget(
                  shakeConstant: ShakeVerticalConstant1(),
                  duration: const Duration(milliseconds: 200),
                  autoPlay: widget.controller.setAnimation,
                  child: Keyboard(
                    onKeyboardTap: provider.onKeyboardButtonPressed,
                    onDeleteCancelButtonPressed:
                        provider.onDeleteCancelButtonPressed,
                    onFingerprintButtonPressed:
                        provider.onFingerprintButtonPressed,
                    fingerPrintEnable: provider.fingerPrintEnabled,
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class PasscodeCircle extends StatelessWidget {
  const PasscodeCircle({
    Key? key,
    required this.extraSize,
  }) : super(key: key);

  final double extraSize;

  @override
  Widget build(BuildContext context) {
    return Consumer<PasscodeController>(builder: (context, provider, child) {
      return Semantics(
        value:
            'You entered ${provider.enteredPasscode.length} of ${provider.passwordDigits} ',
        button: false,
        image: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < provider.passwordDigits; i++)
              Container(
                margin: const EdgeInsets.only(left: 12, right: 12),
                child: Circle(
                  isError: provider.error != null,
                  filled: i < provider.enteredPasscode.length,
                  circleUIConfig: const CircleUIConfig(),
                  extraSize: extraSize,
                ),
              ),
          ],
        ),
      );
    });
  }
}
