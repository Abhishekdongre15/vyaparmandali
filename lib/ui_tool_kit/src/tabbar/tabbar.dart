import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

import 'tabbar_indicator.dart';

class ToolkitTab extends StatelessWidget {
  const ToolkitTab({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: ToolkitTypography.body3A,
      ),
    );
  }
}

class ToolkitTabBar extends StatelessWidget {
  const ToolkitTabBar({Key? key, this.controller, required this.tabs}) : super(key: key);

  final TabController? controller;
  final List<ToolkitTab> tabs;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 25),
      child: Center(
        child: TabBar(
          isScrollable: true,
          tabs: tabs,
          controller: controller,
          labelColor: ToolkitColors.secondary,
          indicatorColor: ToolkitColors.primary,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelStyle: ToolkitTypography.verySmallB.copyWith(color: ToolkitColors.secondary),
          labelStyle: ToolkitTypography.verySmallB.copyWith(color: ToolkitColors.secondary),
          indicator: CustomUnderlineTabIndicator(
            borderSide: BorderSide(color: ToolkitColors.primary),
            insets: const EdgeInsets.fromLTRB(-10, 0, -10, -4),
          ),
        ),
      ),
    );
  }
}
