
import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';

class MyDropDown<T> extends StatelessWidget {
  final T? value;
  final String hint;
  final Image? imgLogo;
  final bool isExpanded;
  final ValueChanged<T?> onChanged;
  final List<DropdownMenuItem<T>>? items;

  const MyDropDown(
      {super.key,
      this.value,
      required this.hint,
      this.isExpanded = false,
      required this.onChanged,
      this.items,
      this.imgLogo});

  @override
  Widget build(BuildContext context) {
    return    DropdownButtonFormField<T>(
      value: value,
      alignment: AlignmentDirectional.centerStart,
      onChanged: onChanged,
      validator: (val){
        if(val==null){
          return "Require Field!!";
        }
        return null;
      },
      hint: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            hint,
            textAlign: TextAlign.start,
          ),
        ),
      ),
      selectedItemBuilder: (BuildContext context) {
        //<-- SEE HERE
        return (items ?? []).map((e) => e.child).toList().map((Widget value) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: value,
            ),
          );
        }).toList();
      },
      items: items,
      isExpanded: isExpanded,
    );
  }
}

