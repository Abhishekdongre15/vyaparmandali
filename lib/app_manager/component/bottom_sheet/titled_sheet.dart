



import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';



class TitledSheet extends StatelessWidget {

  final String title;
  final String? subTitle;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const TitledSheet({Key? key,
  required this.title,
  this.subTitle,
  required this.child, this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20,10,20,0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title.toString(),
                      style: theme.textTheme.titleLarge),
                  subTitle==null? Container():Text(subTitle.toString(),
                      style: theme.textTheme.titleMedium),
                ],
              )),
              IconButton(onPressed: (){
                MyNavigator.pop();
              }, icon:  const Icon(Icons.clear,
              color: AppColor.primaryColor,))
            ],
          ),
        ),
        Padding(
          padding:  padding?? const EdgeInsets.fromLTRB(20,10,20,20),
          child: child,
        )
      ],
    );
  }
}
