import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';


class SimpleListTile extends StatelessWidget {
  const SimpleListTile({
    Key? key,
    required this.title,
    this.onTap,
    this.url,
    this.isLarge = false,
    this.subtitle,
    this.leading,
    this.color,
    this.trailing,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;
  final String? url;
  final bool isLarge;
  final String? subtitle;
  final Widget? leading;
  final Color? color;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title, style: ToolkitTypography.body2A),
      leading: _buildLeading,
      subtitle: _buildSubtitle,
      trailing: trailing ?? (onTap != null ? ToolkitAssets.iconIosForward44.widget() : null),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget? get _buildLeading {
    if (leading != null) {
      return CircleAvatar(
        child: leading,
        backgroundColor: color ?? ToolkitColors.numberBackground,
      );
    }

    if (url != null) {
      return CircleAvatar(
        backgroundImage: NetworkImage(url!),
        radius: isLarge ? 25 : 20,
      );
    }
    return null;
  }

  Widget? get _buildSubtitle {
    if (subtitle != null) {
      return Text(
        subtitle!,
        style: ToolkitTypography.body2B.copyWith(
          color: ToolkitColors.secondaryDarkText,
        ),
      );
    }
    return null;
  }
}
