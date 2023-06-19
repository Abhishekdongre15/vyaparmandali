import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

class CardAction extends StatelessWidget {
  const CardAction({
    Key? key,
    this.front = true,
    this.showIcon = true,
    this.wakeUpAccount = false,
    this.isCardDetailsShow = true,
    required this.onTap,
  }) : super(key: key);

  final bool front;
  final bool showIcon;
  final bool wakeUpAccount;
  final bool isCardDetailsShow;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Row(
          children: [
            if (front) ...[
              if (showIcon)
                ToolkitAssets.iconEyeBG44.widget(
                  boxShadow: [
                    const BoxShadow(
                      offset: Offset.zero,
                      color: ToolkitColors.shadowColor,
                      spreadRadius: -8,
                      blurRadius: 2,
                    ),
                  ],
                )
              else if (wakeUpAccount)
                ToolkitAssets.iconWakeUpAccountWhite.widget(
                  boxShadow: [
                    const BoxShadow(
                      offset: Offset.zero,
                      color: ToolkitColors.shadowColor,
                      spreadRadius: -8,
                      blurRadius: 2,
                    ),
                  ],
                ),
              if (isCardDetailsShow)
                Text(
                  'Card details ',
                  style: ToolkitTypography.cap2B,
                ),
            ] else ...[
              if (showIcon)
                ToolkitAssets.iconEyeSlashBG44.widget(
                  boxShadow: [
                    const BoxShadow(
                      offset: Offset.zero,
                      color: ToolkitColors.shadowColor,
                      spreadRadius: -8,
                      blurRadius: 2,
                    ),
                  ],
                ),
              Text('Hide details', style: ToolkitTypography.cap2B),
            ]
          ],
        ),
      ),
    );
  }
}
