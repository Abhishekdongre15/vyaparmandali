import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

import '../assets.dart';
import 'simple_transaction_block_state.dart';

class SimpleTransactionBlockAvatar extends StatelessWidget {
  const SimpleTransactionBlockAvatar({
    Key? key,
    required this.label,
    this.status,
    this.amount,
    this.state = SimpleTransactionBlockState.normal,
    this.onTap,
    this.subtitle,
    this.labelWidget,
    this.leading,
    this.secondaryAmount,
  }) : super(key: key);

  final String label;
  final String? status;
  final String? subtitle;
  final SimpleTransactionBlockState state;
  final String? amount;
  final VoidCallback? onTap;
  final Widget? labelWidget;
  final Widget? leading;
  final String? secondaryAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 1),
            color: ToolkitColors.shadowColor,
            blurRadius: 4,
            spreadRadius: -1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Card(
          margin: EdgeInsets.zero,
          color: ToolkitColors.white,
          child: InkWell(
            onTap: onTap,
            child: Ink(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (leading != null)
                      CircleAvatar(
                        child: leading,
                        backgroundColor: ToolkitColors.lightPrimary,
                        radius: 20,
                      ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel(),
                        if (subtitle != null) _buildSubtitle(),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        if (status == SimpleTransactionBlockState.declined) _buildStatus(),
                        _buildAmount(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildStatus() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Text(status!),
        decoration: BoxDecoration(
          color: status == SimpleTransactionBlockState.declined ? ToolkitColors.lightError : ToolkitColors.greyLight,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _buildAmount() {
    Text _text = Text(
      '- $amount'.trim(),
      style: ToolkitTypography.body3B.copyWith(
        color: status == SimpleTransactionBlockState.declined ? ToolkitColors.greyDark : null,
      ),
    );

    if (secondaryAmount != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _text,
          Row(
            children: [
              Container(
                child: ToolkitAssets.iconRoundup16.widget(),
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ToolkitColors.greyLight,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
              Text(
                secondaryAmount!,
                style: ToolkitTypography.cap2B.copyWith(color: ToolkitColors.secondaryDarkText),
              ),
            ],
          ),
        ],
      );
    }

    if (state == SimpleTransactionBlockState.credit) {
      return Container(
        decoration: BoxDecoration(
          color: ToolkitColors.lightPrimary,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Text(
          '+ $amount',
          style: ToolkitTypography.body3B.copyWith(
            color: state == SimpleTransactionBlockState.declined ? ToolkitColors.greyDark : null,
          ),
        ),
      );
    }

    return _text;
  }

  Widget _buildLabel() {
    return Row(
      children: [
        Text(label, style: ToolkitTypography.body3B),
        if (labelWidget != null)
          Container(
            child: labelWidget!,
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.only(left: 8),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: ToolkitColors.greyLight),
          ),
      ],
    );
  }

  Text _buildSubtitle() => Text(
        subtitle!,
        style: ToolkitTypography.body3B.copyWith(
          color: ToolkitColors.secondaryDarkText,
        ),
      );
}
