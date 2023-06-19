import 'package:flutter/material.dart';

import '../colors.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    required this.pages,
    required this.selected,
    this.onTap,
  })  : assert(selected < pages),
        super(key: key);

  final int pages;
  final int selected;
  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int index = 0; index < pages; index++)
          GestureDetector(
            onTap: () => onTap?.call(index),
            child: Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.only(left: 4.0, right: 4.0, top: 4.0, bottom: 4.0),
              // margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == selected ? ToolkitColors.greyDark : ToolkitColors.greyLight,
              ),
            ),
          )
      ],
    );
  }
}
