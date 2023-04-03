import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';

class GridStatus extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;
  const GridStatus({Key? key, required this.active, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(child: Text(active? "Active": "N/A",
        style: TextStyle(
          color: active? AppColor.primaryColor:AppColor.black
        ),)),
        Switch(
            activeColor: AppColor.primaryColor,
            value: active, onChanged: (bool val){
          onChanged(val);
        }),
      ],
    );
  }
}
