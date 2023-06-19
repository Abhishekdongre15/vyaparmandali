import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

class BulletPointWidget extends StatelessWidget {
  const BulletPointWidget({
    Key? key,
    this.color,
    required this.text,
    this.style,
  }) : super(key: key);

  final Color? color;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(23),
      },
      children: [
        TableRow(
          children: <Widget>[
            TableCell(
              child: Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Icon(Icons.circle, size: 4, color: color ?? ToolkitColors.secondaryDarkText),
              ),
            ),
            TableCell(
              child: Text(
                text,
                style: style ?? ToolkitTypography.body3B.copyWith(color: ToolkitColors.secondaryDarkText),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        )
      ],
    );
  }
}
