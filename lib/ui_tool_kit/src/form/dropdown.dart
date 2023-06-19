import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

class CustomDropDownFormField extends StatefulWidget {
  const CustomDropDownFormField({
    Key? key,
    this.value,
    required this.label,
    this.isRequired = false,
    this.validator,
    this.onChanged,
    this.items,
    this.hintText, this.onTap,
  }) : super(key: key);

  final dynamic value;
  final String label;
  final String? hintText;
  final bool isRequired;
  final String? Function(Object? value)? validator;
  final void Function(Object? value)? onChanged;
  final List<DropdownMenuItem<Object>>? items;
  final VoidCallback? onTap;

  @override
  _CustomDropDownFormFieldState createState() => _CustomDropDownFormFieldState();
}

class _CustomDropDownFormFieldState extends State<CustomDropDownFormField> {
  String? _validator(Object? value) {
    if (widget.isRequired) {
      if (value == null) return 'Required';
    }
    return widget.validator?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.value,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      items: widget.items,
      style: ToolkitTypography.body1B.copyWith(color: ToolkitColors.secondary),
      icon: ToolkitAssets.iconIosDown44.widget(color: widget.items == null ? ToolkitColors.greyDark : ToolkitColors.secondary),
      validator: _validator,
      decoration: InputDecoration(
        // text
        labelText: widget.label,
        hintText: widget.hintText,

        // styles
        labelStyle: ToolkitTypography.body1B.copyWith(color: ToolkitColors.greyDark),
        hintStyle: ToolkitTypography.body1B.copyWith(color: ToolkitColors.greyDark),
        floatingLabelStyle: ToolkitTypography.body3A.copyWith(color: ToolkitColors.secondary),
        errorStyle: ToolkitTypography.verySmallB.copyWith(color: ToolkitColors.error, height: 0.6),

        // border
        border: const UnderlineInputBorder(borderSide: BorderSide(color: ToolkitColors.greyDark, width: 0.5)),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: ToolkitColors.greyDark, width: 0.5)),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: ToolkitColors.greyDark, width: 0.5)),
        errorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: ToolkitColors.error, width: 0.5)),

        // config
        isDense: true,
        contentPadding: const EdgeInsets.only(top: 6, bottom: 5, right: 5),

        // icons
        suffixIconConstraints: const BoxConstraints(maxWidth: 35),
      ),
    );
  }
}
