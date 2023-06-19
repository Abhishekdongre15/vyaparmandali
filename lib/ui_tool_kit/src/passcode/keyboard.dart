import 'package:flutter/material.dart';

import '../../uitoolkit.dart';

class Keyboard extends StatelessWidget {
  final Function(String text) onKeyboardTap;
  final VoidCallback onDeleteCancelButtonPressed;
  final VoidCallback onFingerprintButtonPressed;
  final bool fingerPrintEnable;

  const Keyboard({
    Key? key,
    required this.onKeyboardTap,
    required this.onDeleteCancelButtonPressed,
    required this.onFingerprintButtonPressed,
    required this.fingerPrintEnable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => _buildKeyboard(context);

  Widget _buildKeyboard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 2,
        crossAxisCount: 3,
        mainAxisSpacing: 25,
        children: [
          _buildKeyboardDigit('1'),
          _buildKeyboardDigit('2'),
          _buildKeyboardDigit('3'),
          _buildKeyboardDigit('4'),
          _buildKeyboardDigit('5'),
          _buildKeyboardDigit('6'),
          _buildKeyboardDigit('7'),
          _buildKeyboardDigit('8'),
          _buildKeyboardDigit('9'),
          fingerPrintEnable ? _buildFingerprintButton(onFingerprintButtonPressed) : const SizedBox(),
          _buildKeyboardDigit('0'),
          _buildDeleteButton(onDeleteCancelButtonPressed),
        ],
      ),
    );
  }

  Widget _buildKeyboardDigit(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: InkWell(
        customBorder: const CircleBorder(),
        highlightColor: ToolkitColors.numberBackground,
        focusColor: ToolkitColors.numberBackground,
        onTap: () {
          onKeyboardTap(text);
        },
        child: CircleAvatar(
          backgroundColor: ToolkitColors.numberBackground.withOpacity(0.2),
          child: Semantics(
            child: Text(
              text,
              semanticsLabel: text,
              textAlign: TextAlign.center,
              style: ToolkitTypography.h1B.copyWith(
                color: ToolkitColors.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton(Function() _onDeleteCancelButtonPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Semantics(
        value: 'Delete',
        button: true,
        image: false,
        child: InkWell(
          highlightColor: ToolkitColors.numberBackground,
          focusColor: ToolkitColors.numberBackground,
          onTap: _onDeleteCancelButtonPressed,
          customBorder: const CircleBorder(),
          child: CircleAvatar(
            minRadius: 30,
            backgroundColor: ToolkitColors.numberBackground.withOpacity(0.2),
            child: ToolkitAssets.iconPassCodeBackSpace.widget(width: 35, height: 35),
          ),
        ),
      ),
    );
  }

  Widget _buildFingerprintButton(Function() _onFingerprintButtonPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Semantics(
        value: 'Biometric identification',
        button: true,
        image: false,
        child: InkWell(
          highlightColor: ToolkitColors.numberBackground,
          focusColor: ToolkitColors.numberBackground,
          onTap: _onFingerprintButtonPressed,
          customBorder: const CircleBorder(),
          child: CircleAvatar(
            minRadius: 30,
            backgroundColor: ToolkitColors.numberBackground.withOpacity(0.2),
            child: ToolkitAssets.iconPassCodeFingerPrint.widget(width: 35, height: 35),
          ),
        ),
      ),
    );
  }
}
