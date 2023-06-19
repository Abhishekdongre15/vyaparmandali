import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vyaparmandali/ui_tool_kit/src/custom_bullet_point/custom_bullet_point.dart';
import 'package:vyaparmandali/ui_tool_kit/uitoolkit.dart';


class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.label,
    this.isRequired = false,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.keyboardType,
    this.inputFormatters,
    this.style,
    this.prefixText,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.onChanged,
    this.onSaved,
    this.prefixStyle,
    this.suffix,
    this.onFieldSubmitted,
    this.onTap,
    this.isOverLay = false,
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
    this.errorText,
    this.textStreamController,
    this.isPasswordField = false,
    this.showClearButton = true,
    this.clearEvent,
    this.textCapitalization,
    this.maxLength,
    this.labelStyle,
    this.floatingLabelStyle,
    this.showSuffixOnFocus = true,
    this.maxLines,
    this.expands = false,
    this.minLines,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? label;
  final bool isRequired;
  final String? Function(String? value)? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final ToolkitAssets? prefix;
  final Widget? suffix;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final TextStyle? prefixStyle;
  final String? prefixText;
  final bool obscureText;
  final String obscuringCharacter;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final VoidCallback? onTap;
  final String? errorText;
  final bool isOverLay;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? dob;
  final StreamController<String>? textStreamController;
  final bool isPasswordField;
  final bool showClearButton;
  final bool? Function(bool? value)? clearEvent;
  final TextCapitalization? textCapitalization;
  final int? maxLength;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final bool showSuffixOnFocus;
  final int? maxLines;
  final bool expands;
  final int? minLines;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final layerLink = LayerLink();
  OverlayEntry? entry;
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  StreamController<bool> streamController = StreamController<bool>();
  var isOverlayShow = false;
  var enterdText = '';

  @override
  void initState() {
    super.initState();
    widget.textStreamController?.stream.listen((event) {
      if (isOverlayShow) {
        setState(() {
          enterdText = event;
          hideOverLay();
          showOverlay();
        });
      } else {
        if (!Validator().hasMinLength(event, 8) ||
            !Validator().hasMinNumericChar(event, 1) ||
            !Validator().hasMinSpecialChar(event, 1) ||
            Validator().validateConsecutiveSeq(event) ||
            Validator().hasFirstName(event, widget.firstName!) ||
            Validator().hasFirstName(event, widget.lastName!) ||
            Validator().hasFirstName(event, widget.email!) ||
            Validator().hasFirstName(event, widget.dob!)) {
          setState(() {
            isOverlayShow = true;
            if (entry == null) {
              showOverlay();
            }
            enterdText = event;
          });
        }
      }
    });
    streamController.stream.listen((event) {
      if (event) {
        if (isOverlayShow) {
          setState(() {
            isOverlayShow = false;
          });
          hideOverLay();
        }
      } else {
        if (!isOverlayShow) {
          setState(() {
            isOverlayShow = true;
          });
          showOverlay();
        }
      }
    });
    _controller = widget.controller ?? TextEditingController();
    _focusNode.addListener(_focusNodeListener);
    _controller.addListener(_focusNodeListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if ((widget.obscureText && widget.isOverLay && _focusNode.hasFocus)) {
        setState(() {
          isOverlayShow = true;
        });
        showOverlay();
      } else {
        setState(() {
          isOverlayShow = false;
        });
        hideOverLay();
      }
    });
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && widget.isOverLay) {
        setState(() {
          isOverlayShow = true;
        });
        showOverlay();
        // showOverlay();
      } else {
        setState(() {
          isOverlayShow = false;
        });
        hideOverLay();
      }
    });
  }

  @override
  void didChangeDependencies() {
    if (!_focusNode.hasFocus) {
      hideOverLay();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_focusNodeListener);
    super.dispose();
  }

  void _focusNodeListener() {
    setState(() {});
  }

  String? _validator(String? value) {
    if (widget.isRequired) {
      if (value!.isEmpty) return 'Required';
    }
    return widget.validator?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: Stack(
        children: [
          TextFormField(
            cursorColor: ToolkitColors.formCursor,
            cursorWidth: 1,
            cursorHeight: 24,
            cursorRadius: const Radius.circular(2),
            style: widget.style ??
                ToolkitTypography.body1B
                    .copyWith(color: ToolkitColors.secondary),
            validator: _validator,
            maxLength: widget.maxLength,
            expands: widget.expands,
            keyboardType: widget.keyboardType,
            autofocus: widget.autofocus,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            focusNode: _focusNode,
            controller: _controller,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            inputFormatters: [
              ...?widget.inputFormatters,
              NoLeadingSpaceFormatter(),
              FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9#+-@_. ]*")),
            ],
            onChanged: widget.onChanged,
            obscureText: widget.obscureText,
            obscuringCharacter: widget.obscuringCharacter,
            onFieldSubmitted: widget.onFieldSubmitted,
            onSaved: widget.onSaved,
            onTap: widget.onTap,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.sentences,
            decoration: InputDecoration(
              // text
              labelText: widget.label,
              hintText: widget.hintText,
              prefixText: widget.prefixText,
              errorText: widget.errorText,

              // styles
              prefixStyle: widget.prefixStyle,
              labelStyle: widget.labelStyle ??
                  ToolkitTypography.body1B
                      .copyWith(color: ToolkitColors.greyDark),
              hintStyle: widget!.hintStyle != null
                  ? widget.hintStyle
                  : ToolkitTypography.body1B
                      .copyWith(color: ToolkitColors.greyDark),
              floatingLabelStyle: widget.floatingLabelStyle ??
                  ToolkitTypography.body3A
                      .copyWith(color: ToolkitColors.secondary),
              errorStyle: ToolkitTypography.verySmallB
                  .copyWith(color: ToolkitColors.error, height: 0.6),

              // border
              border: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: ToolkitColors.greyDark, width: 0.5)),
              focusedBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: ToolkitColors.secondary, width: 0.5)),
              disabledBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: ToolkitColors.greyDark, width: 0.5)),
              enabledBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: ToolkitColors.greyDark, width: 0.5)),
              errorBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: ToolkitColors.error, width: 0.5)),
              focusedErrorBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: ToolkitColors.error, width: 0.5)),

              // config
              contentPadding:
                  const EdgeInsets.only(top: 6, bottom: 11, right: 5),

              // icons
              suffixIconConstraints: widget.suffix == null
                  ? const BoxConstraints(maxWidth: 35, maxHeight: 16)
                  : null,
              prefixIconConstraints: const BoxConstraints(maxWidth: 35),
              suffixIcon: _buildSuffixIcon,
              prefixIcon: widget.prefix != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Semantics(
                        textField: true,
                        child: widget.prefix!.widget(
                          color: _focusNode.hasFocus
                              ? ToolkitColors.secondary
                              : ToolkitColors.greyDark,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget? get _buildSuffixIcon {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if ((_focusNode.hasFocus && _controller.text.isNotEmpty) ||
            !widget.showSuffixOnFocus) ...[
          if (widget.suffix != null) widget.suffix!,
          if (widget.showClearButton) _buildClear(),
        ]
      ].map((e) => Flexible(child: e)).toList(),
    );
  }

  Widget _buildClear() {
    if (widget.showClearButton) {
      return IconButton(
        padding: EdgeInsets.zero,
        onPressed: widget.clearEvent == null
            ? _controller.clear
            : () {
                widget.clearEvent?.call(true);
              },
        icon: Semantics(
          label: 'Clear',
          button: false,
          excludeSemantics: true,
          child: ToolkitAssets.iconFormClear.widget(),
        ),
      );
    }

    return Container();
  }

  void showOverlay() {
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width + 12,
        child: CompositedTransformFollower(
          showWhenUnlinked: false,
          offset: Offset(-6, size.height + 2),
          link: layerLink,
          child: buildOverlay(
            _controller.text,
          ),
        ),
      ),
    );
    if (_focusNode.hasFocus) overlay.insert(entry!);
  }

  void hideOverLay() {
    entry?.remove();
    entry = null;
  }

  Widget buildOverlay(String? value) {
    return BulletPoint(
      isOverlayShow: isOverlayShow,
      text: value ?? enterdText,
      streamController: streamController,
      password: _controller,
      firstName: widget.firstName!,
      lastName: widget.lastName!,
      email: widget.email!,
      dob: widget.dob!,
    );
  }
}

//This Class is used to remove all the formatting in textinputfield
class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String trimedText = newValue.text.trimLeft();

      return TextEditingValue(
        text: trimedText,
        selection: TextSelection(
          baseOffset: trimedText.length,
          extentOffset: trimedText.length,
        ),
      );
    }

    return newValue;
  }
}
