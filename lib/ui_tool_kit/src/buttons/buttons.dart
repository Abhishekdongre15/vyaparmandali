// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/roundup/roundup_multiplier.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

import 'checkbox.dart';
import 'radio.dart';

enum IconButtonControlAffinity { leading, trailing }

class UIToolkitButtons {
  static const double _height = 44;
  static TextStyle get _textstylePrimary =>
      ToolkitTypography.body2A.copyWith(color: ToolkitColors.secondary);
  static TextStyle get _textstyleSecondary =>
      ToolkitTypography.body2B.copyWith(color: ToolkitColors.secondary);

  static ButtonStyle get _buttonStyle => ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ToolkitColors.primary),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        elevation: MaterialStateProperty.all(0),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      );

  static Widget functionButtonLight({
    required String text,
    required VoidCallback onPressed,
    RoundupMultipler? multipler,
  }) {
    return Container(
      height: 48,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            color: ToolkitColors.shadowColor,
            blurRadius: 4,
            spreadRadius: 0,
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: _buttonStyle.copyWith(
          backgroundColor: MaterialStateProperty.all(ToolkitColors.white),
          overlayColor: MaterialStateProperty.all(
              ToolkitColors.secondary.withOpacity(0.1)),
          padding: MaterialStateProperty.all(const EdgeInsets.only(left: 16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: _textstylePrimary),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (multipler != null) _Roundup(multipler: multipler),
                ToolkitAssets.iconIosForward44.widget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget primaryButton({
    required String text,
    required VoidCallback onPressed,
    ButtonStyle? style,
  }) {
    return SizedBox(
      height: _height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text, style: _textstylePrimary),
        style: style?.merge(_buttonStyle) ?? _buttonStyle,
      ),
    );
  }

  static Widget primaryButtonDark({
    required String text,
    required VoidCallback onPressed,
    ButtonStyle? style,
  }) {
    style ??= ButtonStyle(
      backgroundColor: MaterialStateProperty.all(ToolkitColors.secondary),
    );
    return SizedBox(
      height: _height,
      child: ElevatedButton(
        onPressed: onPressed,
        child:
            Text(text, style: _textstylePrimary.copyWith(color: Colors.white)),
        style: style.merge(_buttonStyle),
      ),
    );
  }

  static Widget primaryButtonLight({
    required String text,
    required VoidCallback onPressed,
    ButtonStyle? style,
  }) {
    style ??= ButtonStyle(
      overlayColor:
          MaterialStateProperty.all(ToolkitColors.secondary.withOpacity(0.1)),
      backgroundColor: MaterialStateProperty.all(ToolkitColors.white),
    );
    return SizedBox(
      height: _height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text, style: _textstylePrimary),
        style: style.merge(_buttonStyle),
      ),
    );
  }

  static Widget secondaryButtonDark({
    required String text,
    required VoidCallback onPressed,
    ButtonStyle? style,
  }) {
    style ??= ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      overlayColor:
          MaterialStateProperty.all(ToolkitColors.secondary.withOpacity(0.1)),
      side: MaterialStateProperty.all(
          const BorderSide(color: ToolkitColors.secondary)),
    );

    return SizedBox(
      height: _height,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(text, style: _textstyleSecondary),
        style: style.merge(_buttonStyle),
      ),
    );
  }

  static Widget secondaryButtonLight({
    required String text,
    required VoidCallback onPressed,
    ButtonStyle? style,
  }) {
    style ??= ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      overlayColor:
          MaterialStateProperty.all(ToolkitColors.white.withOpacity(0.2)),
      side: MaterialStateProperty.all(
          const BorderSide(color: ToolkitColors.white)),
    );

    return SizedBox(
      height: _height,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(text,
            style: _textstyleSecondary.copyWith(color: ToolkitColors.white)),
        style: style.merge(_buttonStyle),
      ),
    );
  }

  static Widget iconButton({
    required String text,
    required VoidCallback onPressed,
    IconButtonControlAffinity? controlAffinity =
        IconButtonControlAffinity.leading,
    ToolkitAssets? icon,
  }) {
    ButtonStyle style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      overlayColor:
          MaterialStateProperty.all(ToolkitColors.secondary.withOpacity(0.05)),
    );

    return TextButton(
      style: style,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (controlAffinity == IconButtonControlAffinity.leading)
            icon?.widget(boxShadow: [
                  const BoxShadow(
                    offset: Offset.zero,
                    color: ToolkitColors.shadowColor,
                    spreadRadius: -10,
                    blurRadius: 3,
                  ),
                ]) ??
                ToolkitAssets.iconPlusButton.widget(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,
                style: (icon != null
                        ? ToolkitTypography.cap2B
                        : ToolkitTypography.body2A)
                    .copyWith(color: ToolkitColors.secondary)),
          ),
          if (controlAffinity == IconButtonControlAffinity.trailing)
            icon?.widget(boxShadow: [
                  const BoxShadow(
                    offset: Offset.zero,
                    color: ToolkitColors.shadowColor,
                    spreadRadius: -10,
                    blurRadius: 3,
                  ),
                ]) ??
                ToolkitAssets.iconPlusButton.widget(),
        ],
      ),
    );
  }

  static Widget iconButtonSecondary({
    required String text,
    required VoidCallback onPressed,
    IconButtonControlAffinity? controlAffinity =
        IconButtonControlAffinity.leading,
    required ToolkitAssets icon,
  }) {
    ButtonStyle style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      overlayColor:
          MaterialStateProperty.all(ToolkitColors.secondary.withOpacity(0.05)),
    );

    return TextButton(
      style: style,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (controlAffinity == IconButtonControlAffinity.leading)
            icon.widget(boxShadow: [
              const BoxShadow(
                offset: Offset.zero,
                color: ToolkitColors.shadowColor,
                spreadRadius: -10,
                blurRadius: 3,
              ),
            ]),
          Text(text,
              style: ToolkitTypography.cap2B
                  .copyWith(color: ToolkitColors.secondary)),
          if (controlAffinity == IconButtonControlAffinity.trailing)
            icon.widget(boxShadow: [
              const BoxShadow(
                offset: Offset.zero,
                color: ToolkitColors.shadowColor,
                spreadRadius: -10,
                blurRadius: 3,
              ),
            ]),
        ],
      ),
    );
  }

  static Widget roundupMultiplier({
    required VoidCallback onPressed,
    required String text,
    required bool selected,
  }) {
    return SizedBox(
      height: 48,
      width: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style:
              ToolkitTypography.body1A.copyWith(color: ToolkitColors.secondary),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: selected ? ToolkitColors.primary : ToolkitColors.greyLight,
          side: selected
              ? const BorderSide(width: 1, color: ToolkitColors.secondary)
              : null,
        ).merge(_buttonStyle),
      ),
    );
  }

  static Widget radio({
    required dynamic value,
    required dynamic groupValue,
    required void Function(dynamic value)? onChanged,
  }) {
    return Container(
      height: 24,
      decoration: const BoxDecoration(
        color: ToolkitColors.white,
        shape: BoxShape.circle,
      ),
      child: CustomRadio(
        value: value,
        outerRadius: 12,
        innerRadius: 6,
        fillColor: MaterialStateProperty.all(ToolkitColors.secondary),
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }

  static Widget checkbox({
    required bool? value,
    required void Function(bool? value)? onChanged,
  }) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: ToolkitColors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4),
      ),
      child: CustomCheckbox(
        width: 24,
        strokeWidth: 2,
        side: const BorderSide(width: 1, color: ToolkitColors.greyDark),
        checkColor: ToolkitColors.secondary,
        activeColor: ToolkitColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        tristate: true,
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  static Widget textButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    ButtonStyle style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      overlayColor:
          MaterialStateProperty.all(ToolkitColors.secondary.withOpacity(0.05)),
    );

    return TextButton(
      style: style,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Text(text,
                style: ToolkitTypography.body2A
                    .copyWith(color: ToolkitColors.linkBlue)),
          ),
        ],
      ),
    );
  }

  static Widget smallActionButton({
    VoidCallback? onPressed,
    Widget? leading,
    Widget? trailing,
    required final String text,
    Color? color,
    double? height,
    double? width,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color ?? ToolkitColors.greyLight,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              leading ?? ToolkitAssets.iconRoundup16.widget(),
              Text(
                text,
                style: ToolkitTypography.body3B,
                textAlign: TextAlign.center,
                textHeightBehavior: const TextHeightBehavior(
                    leadingDistribution: TextLeadingDistribution.even),
              ),
              trailing ?? ToolkitAssets.iconSmallChevron.widget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Roundup extends StatelessWidget {
  const _Roundup({
    Key? key,
    required this.multipler,
  }) : super(key: key);

  final RoundupMultipler multipler;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 41,
      decoration: BoxDecoration(
        color: ToolkitColors.greyLight,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ToolkitAssets.iconRoundup16.widget(),
          Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: Text(
              multipler.multiplier,
              style: ToolkitTypography.cap1B
                  .copyWith(color: ToolkitColors.secondary),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
