



import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';

class DataGridPrimaryColorLook extends StatelessWidget {
  final String text;

  const DataGridPrimaryColorLook({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.05),
          border: Border.all(
              color: AppColor.primaryColor,
              width: 0.5
          )
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8,4,8,4,),
        child: Text(text,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColor.primaryColor
          )),
      ),
    );
  }
}
