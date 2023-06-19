import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/uitoolkit.dart';


class ToolkitBottomNavigationBar extends StatelessWidget {
  const ToolkitBottomNavigationBar({
    Key? key,
    this.currentIndex,
    this.onTap,
    required this.items,
  }) : super(key: key);

  final int? currentIndex;
  final Function(int value)? onTap;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        height: 49,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ToolkitColors.greyLight,
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentIndex ?? 0,
          onTap: onTap,
          backgroundColor: ToolkitColors.white,
          type: BottomNavigationBarType.fixed,
          fixedColor: ToolkitColors.primaryDarkText,
          unselectedItemColor: ToolkitColors.primaryDarkText,
          selectedLabelStyle: ToolkitTypography.verySmallB.copyWith(color: ToolkitColors.primaryDarkText),
          unselectedLabelStyle: ToolkitTypography.verySmallB.copyWith(color: ToolkitColors.primaryDarkText),
          items: items,
        ),
      ),
    );
  }
}
