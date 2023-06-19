import 'dart:math';

import 'package:flutter/material.dart';

class AnimationIconWidget extends StatefulWidget {
  final Widget child;

  const AnimationIconWidget({Key? key, required this.child}) : super(key: key);

  @override
  _AnimationIconWidgetState createState() => _AnimationIconWidgetState();
}

class _AnimationIconWidgetState extends State<AnimationIconWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> opacityAnimation;
  double angle = 30;
  bool isTilt = true;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      //reverseDuration: Duration(milliseconds: 500),
    );
    animation = Tween<double>(begin: -1, end: 2).animate(controller);
    opacityAnimation = Tween<double>(begin: 0.1, end: 1).animate(controller);
    controller.repeat(reverse: true);
    controller.addListener(() {
      controller.addStatusListener((status) {
        if (status.name == 'reverse') {
          controller.clearListeners();
        }
      });
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: angle),
            duration: const Duration(milliseconds: 800),
            curve: Curves.elasticInOut,
            builder: (BuildContext context, double val, __) {
              if (val >= (pi / 5)) {
                isTilt = false;
              } else {
                isTilt = true;
              }
              return ScaleTransition(
                scale: animation,
                child: Opacity(
                  opacity: opacityAnimation.value,
                  child: Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()
                        ..setEntry(2, 1, 0.006)
                        ..rotateY(pi * animation.value),
                      child: widget.child),
                ),
              );
            }));
  }
}