import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

enum CardSettingsItems { freeze, unfreeze, settings, orderCard, viewPin }

extension CardSettingsItemsConfig on CardSettingsItems {
  String get label {
    switch (this) {
      case CardSettingsItems.freeze:
        return 'Freeze';
      case CardSettingsItems.unfreeze:
        return 'Unfreeze';
      case CardSettingsItems.settings:
        return 'Settings';
      case CardSettingsItems.orderCard:
        return 'Order card';
      case CardSettingsItems.viewPin:
        return 'PIN';
    }
  }

  Widget get image {
    switch (this) {
      case CardSettingsItems.freeze:
        return ToolkitAssets.iconFreeze.widget();
      case CardSettingsItems.unfreeze:
        return ToolkitAssets.iconFreeze.widget(color: ToolkitColors.white);
      case CardSettingsItems.settings:
        return ToolkitAssets.iconSettings.widget();
      case CardSettingsItems.orderCard:
        return ToolkitAssets.iconOrderCard.widget();
      case CardSettingsItems.viewPin:
        return ToolkitAssets.lineDots.widget();
    }
  }

  Widget _getCard({
    VoidCallback? onTap,
    Color? color,
    Color? labelColor,
  }) =>
      Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
              color: ToolkitColors.greyMediumDark,
              blurRadius: 4,
              spreadRadius: -6,
              offset: Offset.zero,
            ),
          ],
        ),
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
            child: Ink(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  image,
                  Text(
                    label,
                    style: ToolkitTypography.cap2B.copyWith(
                      color: labelColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget widget({VoidCallback? onTap}) {
    switch (this) {
      case CardSettingsItems.freeze:
        return _getCard(onTap: onTap);
      case CardSettingsItems.unfreeze:
        return _getCard(onTap: onTap, color: ToolkitColors.secondary, labelColor: ToolkitColors.white);
      case CardSettingsItems.settings:
        return _getCard(onTap: onTap);
      case CardSettingsItems.orderCard:
        return _getCard(onTap: onTap);
      case CardSettingsItems.viewPin:
        return _getCard(onTap: onTap);
    }
  }
}
