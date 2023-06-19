import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';


class TransactionSummaryListItem extends StatelessWidget {
  const TransactionSummaryListItem({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.amount,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  final Widget leading;
  final String title;
  final String subtitle;
  final String amount;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      isThreeLine: true,
      contentPadding: const EdgeInsets.only(right: 18, left: 16),
      leading: leading,
      title: Text(title, style: ToolkitTypography.body3B),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(subtitle, style: ToolkitTypography.cap1B.copyWith(color: ToolkitColors.greyDark)),
              if (trailing != null) trailing!,
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
          Text(amount, style: ToolkitTypography.body3A.copyWith(color: ToolkitColors.secondary)),
        ],
      ),
    );
  }
}
