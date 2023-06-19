import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/functions/get_network_image.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

class SupportListTile extends StatelessWidget {
  const SupportListTile(
      {Key? key,
        required this.title,
        this.onTap,
        this.hasLeading = false,
        this.leading})
      : super(key: key);

  final String title;
  final VoidCallback? onTap;
  final bool hasLeading;
  final Widget? leading;

  SupportListTile copyWith({
    String? title,
    VoidCallback? onTap,
    String? url,
  }) {
    return SupportListTile(
      title: title ?? this.title,
      onTap: onTap ?? this.onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Card(
          margin: EdgeInsets.zero,
          color: ToolkitColors.greyLightest,
          child: InkWell(
            onTap: onTap,
            child: Ink(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if(hasLeading)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.67, top: 10.67, bottom: 10.67),
                      child: leading,
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 14, bottom: 14),
                      child: Text(title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: ToolkitTypography.body2B,
                          textHeightBehavior: const TextHeightBehavior(
                              leadingDistribution:
                              TextLeadingDistribution.even)),
                    ),
                  ),
                  ToolkitAssets.iconIosForward44.widget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
