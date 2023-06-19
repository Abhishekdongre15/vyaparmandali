import 'package:flutter/material.dart';

import '../../uitoolkit.dart';
import 'card_action.dart';

class HibernateCard extends StatefulWidget {
  const HibernateCard(
      {Key? key,
      required this.image,
      required this.label,
      this.onTap,
      required this.wakeupMyAccount})
      : super(key: key);
  final ToolkitAssets image;
  final String label;
  final VoidCallback? onTap;
  final String wakeupMyAccount;
  @override
  State<HibernateCard> createState() => _HibernateCardState();
}

class _HibernateCardState extends State<HibernateCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
              color: ToolkitColors.primary,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: ToolkitColors.shadowColor,
                  blurRadius: 24,
                  spreadRadius: -22,
                  offset: Offset.zero,
                ),
              ]),
        ),
        Center(
          child: Text(
            widget.label,
            textAlign: TextAlign.center,
            style: ToolkitTypography.verySmallA.copyWith(
              color: ToolkitColors.primaryDarkText,
            ),
          ),
        ),
        if (widget.wakeupMyAccount.isNotEmpty)
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              child: Row(
                children: [
                  CardAction(
                      showIcon: true,
                      onTap: widget.onTap!,
                      wakeUpAccount: true,
                      isCardDetailsShow: false),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(widget.wakeupMyAccount,
                        style: ToolkitTypography.cap2B),
                  )
                ],
              ),
              padding: const EdgeInsets.only(
                left: 10,
              ),
            ),
          ),
      ],
    );
  }
}
