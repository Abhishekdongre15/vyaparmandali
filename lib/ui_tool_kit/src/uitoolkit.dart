import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:vyaparmandali/ui_tool_kit/src/card/hibernate_card.dart';
import 'package:vyaparmandali/ui_tool_kit/src/support/support_list_tile.dart';
import 'package:vyaparmandali/ui_tool_kit/src/support/support_list_tile.dart';

import 'animation_icon/animation_icon.dart';
import 'assets.dart';
import 'bottom_navbar/bottom_navbar.dart';
import 'bottom_sheet/bottom_sheet.dart';
import 'bulle_point/bullet_point_widget.dart';
import 'card/card.dart';
import 'card/controller.dart';
import 'card/model.dart';
import 'card/models.dart';
import 'carousel/carousel.dart';
import 'colors.dart';
import 'dob/date_widget.dart';
import 'dot_indicator/dot_indicator.dart';
import 'form/dropdown.dart';
import 'form/text_field.dart';
import 'passcode/controller.dart';
import 'passcode/passcode_widget.dart';
import 'progress_indicator/indicator.dart';
import 'progress_indicator/overlay_loader.dart';
import 'roundup/account_info_block.dart';
import 'roundup/pot_title_block.dart';
import 'roundup/pot_transaction_block.dart';
import 'roundup/roundup_multiplier.dart';
import 'roundup/simple_list_tile.dart';
import 'roundup/simple_transaction_block.dart';
import 'roundup/simple_transaction_block_state.dart';
import 'roundup/simple_transaction_block_with_avatar.dart';
import 'roundup/transaction_block.dart';
import 'roundup/transaction_block_list.dart';
import 'scaffold/custom_scaffold.dart';
import 'selectors/selector_type.dart';
import 'selectors/selectors.dart';
import 'statements/statement_selector.dart';
import 'tabbar/tabbar.dart';

class UIToolkit {
  static Widget potTitleBlock({
    required String title,
    required String subtitle,
    Widget? trailing,
    RoundupMultipler? roundupMultipler,
  }) {
    return PotTitleBlock(
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      roundupMultipler: roundupMultipler,
    );
  }

  static Widget potTransactionBlock({
    required String title,
    required String subtitle,
    required String amount,
    bool higlighted = false,
  }) {
    return PotTransactionBlock(
      title: title,
      subtitle: subtitle,
      amount: amount,
      highlighted: higlighted,
    );
  }

  static Widget simpleBlock({
    required String label,
    String? status,
    String? amount,
    SimpleTransactionBlockState state = SimpleTransactionBlockState.normal,
    VoidCallback? onTap,
  }) {
    return SimpleTransactionBlock(
      label: label,
      status: status,
      state: state,
      amount: amount,
      onTap: onTap,
    );
  }

  static Widget simpleBlockAvatar({
    required String label,
    String? subtitle,
    String? status,
    String? amount,
    SimpleTransactionBlockState state = SimpleTransactionBlockState.normal,
    VoidCallback? onTap,
    Widget? labelWidget,
    Widget? leading,
    String? secondaryAmount,
  }) {
    return SimpleTransactionBlockAvatar(
      label: label,
      labelWidget: labelWidget,
      secondaryAmount: secondaryAmount,
      leading: leading,
      subtitle: subtitle,
      status: status,
      state: state,
      amount: amount,
      onTap: onTap,
    );
  }

  static Widget transactionBlock({
    required String title,
    String? subtitle,
    Widget? leading,
    VoidCallback? onTap,
    String? url,
    RoundupMultipler? multipler,
    String? amount,
    bool isThreeLine = false,
    bool hasTrailing = true,
    TextStyle? amountStyle,
    TextStyle? titleStyle,
    String? cardText,
  }) {
    return TransactionBlock(
      title: title,
      subtitle: subtitle,
      leading: leading,
      onTap: onTap,
      url: url,
      multipler: multipler,
      amount: amount,
      isThreeLine: isThreeLine,
      hasTrailing: hasTrailing,
      amountStyle: amountStyle,
      titleStyle: titleStyle,
      cardText: cardText,
    );
  }

  static Widget simpleListTileWithBulletPoint({
    required String title,
    VoidCallback? onTap,
    String? url,
    bool isLarge = false,
    String? subtitle,
    Widget? leading,
    Color? color,
    required List<String> bulletPoints,
  }) {
    return Stack(
      children: [
        SimpleListTile(
          title: title,
          onTap: onTap,
          url: url,
          isLarge: isLarge,
          subtitle: subtitle,
          leading: leading,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 55, top: 38),
          child: Column(
            children: bulletPoints.map((e) => UIToolkit.bulletPoint(text: e)).toList(),
          ),
        ),
      ],
    );
  }

  static Widget simpleListTile({
    required String title,
    VoidCallback? onTap,
    String? url,
    bool isLarge = false,
    String? subtitle,
    Widget? leading,
    Color? color,
    Widget? trailing,
  }) {
    return SimpleListTile(
      trailing: trailing,
      title: title,
      onTap: onTap,
      url: url,
      isLarge: isLarge,
      subtitle: subtitle,
      leading: leading,
      color: color,
    );
  }

  static Widget supportListTile({
    required String title,
    VoidCallback? onTap,
    bool hasLeading = false,
    Widget? leading,
  }) {
    return SupportListTile(
      title: title,
      onTap: onTap,
      hasLeading: hasLeading,
      leading: leading,
    );
  }

  static Widget supportListTile2({
    required String title,
    VoidCallback? onTap,
    bool hasLeading = false,
    Widget? leading,
  }) {
    return SupportListTile(
      title: title,
      onTap: onTap,
      hasLeading: hasLeading,
      leading: leading,
    );
  }

  static Widget accountInfoBlock({
    required String title,
    required String subtitle,
    ToolkitAssets? trailing,
    VoidCallback? onTap,
  }) {
    return AccountInfoBlock(
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: onTap,
    );
  }

  static Widget transactionBlockList({
    required List<TransactionBlock> children,
    required int selectedChild,
    bool initiallyExpanded = false,
    Function(int index)? onTap,
  }) {
    return TransactionBlockList(
      children: children,
      selectedChild: selectedChild,
      initiallyExpanded: initiallyExpanded,
      onTap: onTap,
    );
  }

  static Widget selector({
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    ToolkitAssets? image,
    Color color = ToolkitColors.white,
    bool elevated = false,
    SelectorType type = SelectorType.normal,
    dynamic groupValue,
    dynamic value,
    Function(dynamic value)? onRadioTap,
    Function(bool? value)? onCheckboxTap,
    BoxBorder? border,
    Widget? trailing,
  }) {
    return CustomSelector(
      onTap: onTap,
      title: title,
      subtitle: subtitle,
      image: image,
      color: color,
      elevated: elevated,
      type: type,
      groupValue: groupValue,
      value: value,
      onRadioTap: onRadioTap,
      onCheckboxTap: onCheckboxTap,
      border: border,
      trailing: trailing,
    );
  }

  static Widget tabbar({
    required List<ToolkitTab> tabs,
    TabController? controller,
  }) {
    return ToolkitTabBar(
      tabs: tabs,
      controller: controller,
    );
  }

  static Widget bottomNavigationBar({
    int? currentIndex,
    Function(int value)? onTap,
    required List<BottomNavigationBarItem> items,
  }) {
    return ToolkitBottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
    );
  }

  static Widget gridHibernateCard({required ToolkitAssets image, required String label, VoidCallback? onTap, required String wakeupMyAccount}) {
    return HibernateCard(
      image: image,
      label: label,
      wakeupMyAccount: wakeupMyAccount,
      onTap: onTap,
    );
  }

  static Widget card({
    VoidCallback? onCopy,
    Duration? animationDuration,
    CardFace? initialCardFace,
    bool? enableAutoFlipBack,
    Duration? flipBackTime,
    bool? isGreyCard,
    bool? showWakeupIcon,
    bool? showCardDetails,
    bool? showEyeIcon,
    String? labelWakeupAccount,
    required CardDetails details,
    required String label,
    required CardFreezeController freezeController,
    required Future<bool> Function() onGetDetailsTapped,
    VoidCallback? onWakeUpAccountTapped,
  }) {
    return CustomQCard(
      onWakeUpAccountTapped: onWakeUpAccountTapped,
      labelWakeUpAccount: labelWakeupAccount,
      showEye: showEyeIcon ?? true,
      isGreyCard: isGreyCard ?? false,
      showWakeupIcon: showWakeupIcon ?? false,
      onGetDetailsTapped: onGetDetailsTapped,
      freezeController: freezeController,
      label: label,
      details: details,
      onCopy: onCopy,
      animationDuration: animationDuration,
      initialCardFace: initialCardFace,
      enableAutoFlipBack: enableAutoFlipBack ?? true,
      flipBackTime: flipBackTime ?? const Duration(seconds: 15),
      isCardDetailShow: showCardDetails ?? true,
    );
  }

  static Widget bottomSheet({
    required String title,
    List<Widget>? children,
    bool hideHeaderOnExpanded = false,
  }) {
    return CustomBottomSheet(
      title: title,
      hideHeaderOnExpanded: hideHeaderOnExpanded,
      children: children ?? [],
    );
  }

  static Widget carousel(
    BuildContext context, {
    double? height,
    required List<String> items,
  }) {
    return QorbitalCarousel(
      height: height,
      items: items,
    );
  }

  static Widget statementSelector({
    required String title,
    required List<String> children,
    ScrollController? scrollController,
    Duration? animationDuration,
    bool initiallyExpanded = false,
    Function(int index)? childTapped,
  }) {
    return ExpansionTileUI(
      title: title,
      children: children,
      scrollController: scrollController,
      animationDuration: animationDuration,
      initiallyExpanded: initiallyExpanded,
      childTapped: childTapped,
    );
  }

  static Widget dotIndicator({
    required int pages,
    required int selected,
    Function(int index)? onTap,
  }) {
    return DotIndicator(
      pages: pages,
      selected: selected,
      onTap: onTap,
    );
  }

  static Widget textFormField({
    String? label,
    bool isRequired = false,
    String? Function(String? value)? validator,
    TextEditingController? controller,
    String? hintText,
    ToolkitAssets? prefix,
    Widget? suffix,
    bool autofocus = false,
    bool enabled = true,
    bool readOnly = false,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    TextStyle? style,
    TextStyle? prefixStyle,
    TextStyle? hintStyle,
    bool obscureText = false,
    String obscuringCharacter = '*',
    Function(String)? onChanged,
    Function(String?)? onSaved,
    Function(String?)? onFieldSubmitted,
    String? prefixText,
    VoidCallback? onTap,
    bool isOverLay = false,
    String? firstName,
    String? lastName,
    String? email,
    String? dob,
    String? errorText,
    bool isPasswordField = false,
    StreamController<String>? textStreamController,
    bool showClearButton = true,
    bool? Function(bool?)? clearEvent,
    TextCapitalization? textCapitalization,
    int? maxLength,
    TextStyle? labelStyle,
    TextStyle? floatingLabelStyle,
    bool showSuffixOnFocus = true,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
  }) {
    return CustomTextFormField(
      showSuffixOnFocus: showSuffixOnFocus,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      label: label,
      floatingLabelStyle: floatingLabelStyle,
      labelStyle: labelStyle,
      showClearButton: showClearButton,
      isRequired: isRequired,
      validator: validator,
      controller: controller,
      hintText: hintText,
      prefix: prefix,
      suffix: suffix,
      autofocus: autofocus,
      enabled: enabled,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      style: style,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      prefixText: prefixText,
      prefixStyle: prefixStyle,
      hintStyle: hintStyle,
      onTap: onTap,
      isOverLay: isOverLay,
      firstName: firstName,
      lastName: lastName,
      email: email,
      dob: dob,
      errorText: errorText,
      textStreamController: textStreamController,
      isPasswordField: isPasswordField,
      clearEvent: clearEvent,
      textCapitalization: textCapitalization,
    );
  }

  static Widget dropDownFormField({
    required String label,
    bool isRequired = false,
    String? Function(Object? value)? validator,
    List<DropdownMenuItem<Object>>? items,
    void Function(Object? value)? onChanged,
    dynamic value,
    VoidCallback? onTap,
  }) {
    return CustomDropDownFormField(
      label: label,
      onTap: onTap,
      isRequired: isRequired,
      validator: validator,
      items: items,
      onChanged: onChanged,
      value: value,
    );
  }

  static Widget scaffold({
    String? headerTitle,
    required Color? backgroundColor,
    List<Widget>? actions,
    required Widget child,
    ScrollController? controller,
    bool? isPdf,
    VoidCallback? onBack,
  }) {
    return CustomScaffold(
      onBack: onBack,
      controller: controller,
      headerTitle: headerTitle,
      pageBackgroundColor: backgroundColor,
      actions: actions,
      child: child,
      isPdf: isPdf,
    );
  }

  static Widget circleIndicator({
    double? value,
    Color? backgroundColor,
    Color? color,
    Animation<Color?>? valueColor,
    double? strokeWidth,
  }) {
    return Center(
      child: CustomCircularProgressIndicator(
        backgroundColor: backgroundColor,
        color: color ?? ToolkitColors.greyDark,
        strokeWidth: strokeWidth ?? 4.0,
        value: value,
        valueColor: valueColor,
      ),
    );
  }

  static Widget overlayLoader() {
    return const OverlayProgressIndicator();
  }

  static showOverlayLoader(BuildContext context) {
    context.loaderOverlay.show();
  }

  static hideOverlayLoader(BuildContext context) {
    context.loaderOverlay.hide();
  }

  static Widget linearIndicator({
    double? value,
    Color? backgroundColor,
    Color color = ToolkitColors.greyDark,
    Animation<Color?>? valueColor,
    double? strokeWidth,
  }) {
    return Center(
      child: CustomLinearProgressIndicator(
        backgroundColor: backgroundColor ?? color.withOpacity(0.3),
        color: color,
        value: value,
        minHeight: 4,
        valueColor: valueColor,
      ),
    );
  }

  static Widget passcode({
    required String header,
    String? subTitle,
    required PasscodeController controller,
  }) {
    return PasscodeWidget(
      header: header,
      subTitle: subTitle,
      controller: controller,
    );
  }

  static Widget buildDateWidget({
    required Function(DateTime? date) onDobEntered,
    required Function(bool? date) validDateCallBack,
    required isEmptyDate,
    required inValidDateMsg,
    required youAreUnder18,
    required setError,
    DateTime? initialDate,
  }) {
    return DateWidget(
      initialDate: initialDate,
      validDateCallBack: validDateCallBack,
      onDobEnteredCallBack: onDobEntered,
      isEmptyDateMsg: isEmptyDate,
      inValidDateMsg: inValidDateMsg,
      youAreUnder18Msg: youAreUnder18,
      setError: setError,
    );
  }

  static Widget bulletPoint({
    Color? color,
    required String text,
    TextStyle? style,
    // required String step,
    // required String stepTitle,
    // required bool isVerify,
    // required bool isActive,
    // required List<String> stepsBulletPoint,
  }) {
    return BulletPointWidget(
      color: color,
      text: text,
      style: style,
    );
  }

  static Widget animationIcon({required Widget child}) {
    return AnimationIconWidget(child: child);
  }
}
