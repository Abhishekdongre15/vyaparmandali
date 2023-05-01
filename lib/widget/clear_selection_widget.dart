import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';

class ClearSelectionWidget extends StatelessWidget {
  final String label;
  final GestureTapCallback? onTapClear;
  const ClearSelectionWidget({Key? key, required this.label, this.onTapClear}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(label,
            style: const TextStyle(
            ),),
        ),
        InkWell(onTap: onTapClear, child: const Icon(Icons.close,
          color: AppColor.primaryColor,))
      ],
    );
  }
}
