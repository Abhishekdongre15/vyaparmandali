import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/functions/get_network_image.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

import 'roundup_multiplier.dart';

class _DefaultTrailing extends StatelessWidget {
  const _DefaultTrailing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToolkitAssets.iconCardFrontView.widget(
      height: 48,
      width: 48,
      fit: BoxFit.cover,
    );
  }
}

class TransactionBlock extends StatelessWidget {
  const TransactionBlock(
      {Key? key,
      required this.title,
      this.subtitle,
      this.leading,
      this.onTap,
      this.url,
      this.multipler,
      this.amount,
      this.isThreeLine = false,
      this.hasChildren = false,
      this.isElevated = true,
      this.hasTrailing = true,
      this.amountStyle,
      this.titleStyle,
      this.cardText})
      : super(key: key);

  final String title;
  final String? subtitle;
  final Widget? leading;
  final VoidCallback? onTap;
  final String? url;
  final RoundupMultipler? multipler;
  final String? amount;
  final bool isThreeLine;
  final bool hasChildren;
  final bool isElevated;
  final bool hasTrailing;
  final TextStyle? amountStyle;
  final TextStyle? titleStyle;
  final String? cardText;

  TransactionBlock copyWith({
    String? title,
    String? subtitle,
    Widget? leading,
    VoidCallback? onTap,
    String? url,
    RoundupMultipler? multipler,
    String? amount,
    bool? isThreeLine,
    bool? hasChildren,
    bool? isElevated,
    bool? hasTrailing,
    String? cardText,
  }) {
    return TransactionBlock(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      leading: leading ?? this.leading,
      onTap: onTap ?? this.onTap,
      url: url ?? this.url,
      multipler: multipler ?? this.multipler,
      amount: amount ?? this.amount,
      isThreeLine: isThreeLine ?? this.isThreeLine,
      hasChildren: hasChildren ?? this.hasChildren,
      isElevated: isElevated ?? this.isElevated,
      hasTrailing: hasTrailing ?? this.hasTrailing,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: isThreeLine ? 80 : 64),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
        boxShadow: isElevated
            ? const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: ToolkitColors.shadowColor,
                  spreadRadius: 1,
                  blurRadius: 4,
                )
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Card(
          margin: EdgeInsets.zero,
          color: ToolkitColors.white,
          child: InkWell(
            onTap: onTap,
            child: Ink(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildLeading(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 5, top: 12, bottom: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (titleStyle != null)
                              Text(
                                title,
                                style: titleStyle,
                                textHeightBehavior: const TextHeightBehavior(
                                    leadingDistribution:
                                        TextLeadingDistribution.even),
                              )
                            else
                              Text(
                                title,
                                style: subtitle == null
                                    ? ToolkitTypography.body3A
                                    : ToolkitTypography.body3B,
                                textHeightBehavior: const TextHeightBehavior(
                                    leadingDistribution:
                                        TextLeadingDistribution.even),
                              ),
                            _buildSubtitle(),
                            if (amount != null && isThreeLine)
                              Text(
                                amount!,
                                style:
                                    ToolkitTypography.body3A.merge(amountStyle),
                                textHeightBehavior: const TextHeightBehavior(
                                    leadingDistribution:
                                        TextLeadingDistribution.even),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (_buildTrailing() != null) _buildTrailing()!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildSubtitle() {
    return Row(
      children: [
        if (subtitle != null)
          Text(
            subtitle!,
            textHeightBehavior: const TextHeightBehavior(
                leadingDistribution: TextLeadingDistribution.even),
            style: isThreeLine
                ? ToolkitTypography.cap1B.copyWith(
                    color: ToolkitColors.secondaryDarkText,
                  )
                : ToolkitTypography.body3A,
          ),
        if (multipler != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: _buildMultiplier(),
          )
      ],
    );
  }

  Widget _buildLeading() {
    Widget _leading = leading ?? const _DefaultTrailing();
    if (url != null) {
      _leading = ClipRRect(
        borderRadius:
            isThreeLine ? BorderRadius.circular(4) : BorderRadius.circular(8),
        child: getNetworkImage(url!),
      );
    }

    return Container(
      margin: isThreeLine
          ? const EdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 16,
              right: 8,
            )
          : const EdgeInsets.all(8),
      child: ExcludeSemantics(
          child: Stack(
        children: [
          _leading,
          Center(
            child: Text(
              cardText ?? '',
              style: ToolkitTypography.verySmallB,
            ),
          )
        ],
      )),
      constraints: BoxConstraints(
        minHeight: 48,
        maxHeight: 48,
        minWidth: isThreeLine ? 74 : 48,
        maxWidth: isThreeLine ? 74 : 48,
      ),
      decoration: BoxDecoration(
        borderRadius:
            isThreeLine ? BorderRadius.circular(4) : BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 0),
            color: ToolkitColors.shadowColor,
            spreadRadius: -3,
            blurRadius: 2,
          )
        ],
      ),
    );
  }

  Widget? _buildTrailing() {
    if (hasTrailing) {
      if (hasChildren) {
        return ToolkitAssets.iconIosDown44.widget();
      }
      // if (onTap != null) {
      return ToolkitAssets.iconIosForward44.widget();
      // }
    }
  }

  Container _buildMultiplier() {
    return Container(
      height: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ToolkitColors.greyLight,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ToolkitAssets.iconRoundup16.widget(height: 16, width: 16),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
          Text(multipler!.multiplier, style: ToolkitTypography.cap1B),
        ],
      ),
    );
  }
}
