import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/card/base_card.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/functions/show_snackbar.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

import 'card_action.dart';
import 'controller.dart';

class BackView extends StatelessWidget {
  const BackView({
    Key? key,
    required this.showIcon,
    required this.onActionTap,
    this.onChildTap,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvvCode,
    required this.label,
    required this.controller,
  }) : super(key: key);

  final bool showIcon;
  final VoidCallback onActionTap;
  final VoidCallback? onChildTap;
  final String cardNumber;
  final String expiryDate;
  final String cvvCode;
  final String label;
  final CardFreezeController controller;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      controller: controller,
      label: label,
      image: ToolkitAssets.iconCardBackView,
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardAction(
            showIcon: showIcon,
            onTap: onActionTap,
            front: false,
          ),
          Row(
            children: [
              ToolkitAssets.iconCardBackSymbolLabel.widget(),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ToolkitAssets.iconCardBackSymbol.widget(),
              ),
            ],
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  cardNumber,
                  style: ToolkitTypography.body1B,
                ),
                ToolkitAssets.iconCopyNoBG44.widget(
                  color: ToolkitColors.secondary,
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: cardNumber)).then((value) {
                      showCommonSnackbar(context, width: 230, content: 'Card number successfully copied');
                      onChildTap?.call();
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Exp: $expiryDate', style: ToolkitTypography.body1B),
                Text('CVV: $cvvCode', style: ToolkitTypography.body1B),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
