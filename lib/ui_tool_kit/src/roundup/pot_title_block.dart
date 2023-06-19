import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/buttons/buttons.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

import 'roundup_multiplier.dart';

class _DefaultTrailing extends StatelessWidget {
  const _DefaultTrailing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToolkitAssets.iconHexagonUmbrella.widget();
  }
}

class PotTitleBlock extends StatelessWidget {
  const PotTitleBlock({
    Key? key,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.roundupMultipler,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Widget? trailing;
  final RoundupMultipler? roundupMultipler;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: ToolkitTypography.h3.copyWith(color: roundupMultipler == null ? ToolkitColors.greyDark : ToolkitColors.secondary)),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                      Text(subtitle, style: ToolkitTypography.body1A.copyWith(color: roundupMultipler == null ? ToolkitColors.greyDark : ToolkitColors.secondary)),
                    ],
                  ),
                  trailing ?? const _DefaultTrailing(),
                ],
              ),
            ),
            if (roundupMultipler != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: UIToolkitButtons.smallActionButton(text: roundupMultipler!.value),
              ),
          ],
        ),
      ),
    );
  }
}
