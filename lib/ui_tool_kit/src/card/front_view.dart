import 'package:flutter/material.dart';

import '../assets.dart';
import '../colors.dart';
import '../typography.dart';
import 'base_card.dart';
import 'card_action.dart';
import 'controller.dart';

class FrontView extends StatelessWidget {
  const FrontView({
    Key? key,
    required this.showIcon,
    required this.onTap,
    required this.cardNumber,
    required this.label,
    required this.controller,
    this.isGreyCard = false,
    this.showWakeUpIcon = false,
    this.labelWakeupAccount,
    this.showCardDetails = true,
  }) : super(key: key);

  final bool showIcon;
  final VoidCallback onTap;
  final String cardNumber;
  final String label;
  final CardFreezeController controller;
  final bool isGreyCard;
  final bool showWakeUpIcon;
  final bool showCardDetails;
  final String? labelWakeupAccount;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      controller: controller,
      label: label,
      image: isGreyCard ? ToolkitAssets.iconHibernateGreyCard : ToolkitAssets.iconCardFrontView,
      footer: Row(
        children: [
          CardAction(
            showIcon: showIcon,
            onTap: onTap,
            wakeUpAccount: showWakeUpIcon,
            isCardDetailsShow: showCardDetails,
          ),
          if (labelWakeupAccount == null)
            Text(cardNumber, style: ToolkitTypography.cap2B)
          else
            InkWell(
              onTap: onTap,
              child: Text(
                labelWakeupAccount!,
                style: ToolkitTypography.cap2B.copyWith(
                  color: ToolkitColors.primaryDarkText,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
