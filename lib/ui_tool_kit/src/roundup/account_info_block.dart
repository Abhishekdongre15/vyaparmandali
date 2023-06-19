import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

class AccountInfoBlock extends StatelessWidget {
  const AccountInfoBlock({
    Key? key,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final ToolkitAssets? trailing;
  final VoidCallback? onTap;

  void _onTap() {
    Clipboard.setData(ClipboardData(text: subtitle)).then((value) {
      onTap?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        color: ToolkitColors.greyLightest,
        constraints: const BoxConstraints(minHeight: 62),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: ToolkitTypography.body2B.copyWith(color: ToolkitColors.greyDark)),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                  Text(subtitle, style: ToolkitTypography.body1B.copyWith(color: ToolkitColors.primaryDarkText)),
                ],
              ),
              ToolkitAssets.iconCopy44.widget(onTap: _onTap)
            ],
          ),
        ),
      ),
    );
  }
}
