import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';


class PotTransactionBlock extends StatelessWidget {
  const PotTransactionBlock({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.amount,
    this.highlighted = false,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String amount;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        subtitle: Text(subtitle, style: ToolkitTypography.body3B.copyWith(color: ToolkitColors.greyDark)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, style: ToolkitTypography.body3B),
            if (highlighted)
              Container(
                decoration: BoxDecoration(
                  color: ToolkitColors.lightPrimary,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.all(2),
                child: _buildAmount(),
              )
            else
              _buildAmount(),
          ],
        ),
      ),
    );
  }

  Text _buildAmount() {
    return Text(amount, style: ToolkitTypography.body3B);
  }
}
