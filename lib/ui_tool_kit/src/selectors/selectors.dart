import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/buttons/buttons.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

import 'selector_type.dart';

class CustomSelector extends StatelessWidget {
  const CustomSelector({
    Key? key,
    required this.title,
    this.onTap,
    this.subtitle,
    this.image,
    this.color = ToolkitColors.white,
    this.elevated = false,
    this.type = SelectorType.normal,
    this.groupValue,
    this.value,
    this.onRadioTap,
    this.onCheckboxTap,
    this.border,
    this.trailing,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String title;
  final String? subtitle;
  final ToolkitAssets? image;
  final Color color;
  final bool elevated;
  final SelectorType type;
  final BoxBorder? border;
  final Widget? trailing;

  // radio / checkbox options
  final dynamic groupValue;
  final dynamic value;
  final Function(dynamic value)? onRadioTap;
  final Function(bool? value)? onCheckboxTap;

  @override
  Widget build(BuildContext context) {
    if (type == SelectorType.radio) {
      assert(groupValue != null && value != null && onRadioTap != null,
          'groupValue and value and onRadionTap are required !');
    }
    if (type == SelectorType.checkbox) {
      assert(onCheckboxTap != null, 'onCheckboxTap is required !');
    }

    return Container(
      height: subtitle == null ? 48 : 64,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        border: border,
        boxShadow: elevated
            ? const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: ToolkitColors.shadowColor,
                  spreadRadius: -2,
                  blurRadius: 8,
                )
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          color: color,
          child: Semantics(
            button: true,
            child: InkWell(
              onTap: onTap,
              highlightColor: color.withOpacity(0.5),
              child: Ink(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (image != null)
                          ExcludeSemantics(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 8),
                              child: image?.widget(height: 48, width: 48),
                            ),
                          ),
                        Padding(
                          padding: image == null
                              ? const EdgeInsets.only(left: 16)
                              : const EdgeInsets.only(left: 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: ToolkitTypography.body2B.copyWith(
                                  color: ToolkitColors.primaryDarkText,
                                ),
                              ),
                              Row(
                                children: [
                                  if (subtitle != null)
                                    Text(
                                      subtitle!,
                                      style: ToolkitTypography.body3B.copyWith(
                                        color: ToolkitColors.secondaryDarkText,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    _buildTrailing()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTrailing() {
    if (trailing != null) {
      return trailing!;
    }

    if (type == SelectorType.radio) {
      return UIToolkitButtons.radio(
          value: value!, groupValue: groupValue, onChanged: onRadioTap);
    }

    if (type == SelectorType.checkbox) {
      return Padding(
        padding: const EdgeInsets.only(right: 12),
        child:
            UIToolkitButtons.checkbox(value: value, onChanged: onCheckboxTap),
      );
    }

    if (onTap != null) {
      return ExcludeSemantics(child: ToolkitAssets.iconIosForward44.widget());
    }

    return Container();
  }
}
