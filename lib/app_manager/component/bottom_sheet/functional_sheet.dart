import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:vyaparmandali/app_manager/theme/widget_theme_data/custom_button_theme.dart';
import 'package:flutter/material.dart';

class FunctionalSheet extends StatelessWidget {
  final String message;
  final String buttonName;
  final Function onPressButton;
  final bool showCancelButton;
  final TextAlign? textAlign;

  const FunctionalSheet({
    Key? key,
    required this.message,
    required this.buttonName,
    required this.onPressButton,
    this.showCancelButton = true,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Text(message.toString(),
              textAlign: textAlign ?? TextAlign.center,
              style: theme.textTheme.titleMedium!.copyWith(
                color: Colors.black
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Row(
            children: [
              showCancelButton
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: TextButtonTheme(
                          data: CustomButtonTheme.whiteSecondaryButton,
                          child: TextButton(
                            onPressed: () {
                              MyNavigator.pop();
                            },
                            child: const Text("CANCEL"),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Expanded(
                child: TextButtonTheme(
                  data: CustomButtonTheme.secondary,
                  child: TextButton(
                    onPressed: () {
                      MyNavigator.pop();
                      onPressButton();
                    },
                    child: Text(buttonName.toUpperCase()),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
