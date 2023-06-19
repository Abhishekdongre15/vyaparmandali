import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

import 'controller.dart';

class BaseCard extends StatefulWidget {
  const BaseCard({
    Key? key,
    this.child,
    required this.image,
    required this.label,
    required this.footer,
    required this.controller,
  }) : super(key: key);

  final Widget? child;
  final Widget footer;
  final ToolkitAssets image;
  final String label;
  final CardFreezeController controller;

  @override
  State<BaseCard> createState() => _BaseCardState();
}

class _BaseCardState extends State<BaseCard> with SingleTickerProviderStateMixin {
  late final AnimationController _positionController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);

  @override
  void initState() {
    widget.controller.positionController = _positionController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        widget.image.widget(
          // height: 174,
          fit: BoxFit.fill,
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
              color: ToolkitColors.shadowColor,
              blurRadius: 24,
              spreadRadius: -22,
              offset: Offset.zero,
            ),
            // BoxShadow(
            //   color: ToolkitColors.shadowColor,
            //   blurRadius: 10,
            //   spreadRadius: -30,
            //   offset: Offset(0, 25),
            // ),
            // BoxShadow(
            //   color: ToolkitColors.shadowColor,
            //   blurRadius: 10,
            //   spreadRadius: -30,
            //   offset: Offset(0, -20),
            // ),
          ],
        ),
        ChangeNotifierProvider.value(
          value: widget.controller,
          child: Consumer<CardFreezeController>(builder: (context, provider, child) {
            return AnimatedOpacity(
              onEnd: provider.changePosition,
              opacity: provider.opacityLevel,
              duration: provider.animationDuration,
              child: provider.offsetAnimation == null
                  ? _buildWidget()
                  : SlideTransition(
                      position: provider.offsetAnimation!,
                      child: _buildWidget(),
                    ),
            );
          }),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: Text(
            widget.label,
            style: ToolkitTypography.verySmallA.copyWith(
              color: ToolkitColors.primaryDarkText,
            ),
          ),
        ),
        if (widget.child != null) widget.child!,
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: widget.footer,
        ),
      ],
    );
  }

  Widget _buildWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Opacity(
        opacity: 0.8,
        child: ToolkitAssets.iconCardFreezeOverlay.widget(
          fit: BoxFit.fill,
          color: ToolkitColors.lightBackground,
        ),
      ),
    );
  }
}
