import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'back_view.dart';
import 'controller.dart';
import 'front_view.dart';
import 'model.dart';
import 'models.dart';

class CustomQCard extends StatefulWidget {
  const CustomQCard({
    Key? key,
    this.showEye = true,
    this.onCopy,
    required this.label,
    this.animationDuration,
    this.initialCardFace,
    required this.enableAutoFlipBack,
    required this.flipBackTime,
    required this.freezeController,
    required this.details,
    required this.onGetDetailsTapped,
    this.showWakeupIcon = false,
    this.isGreyCard = false,
    this.isCardDetailShow = true,
    this.labelWakeUpAccount,
    this.onWakeUpAccountTapped,
  }) : super(key: key);

  final bool showEye;
  final bool showWakeupIcon;
  final bool isCardDetailShow;
  final bool isGreyCard;
  final VoidCallback? onCopy;
  final String label;
  final String? labelWakeUpAccount;
  final Duration? animationDuration;
  final CardFace? initialCardFace;
  final bool enableAutoFlipBack;
  final Duration flipBackTime;
  final CardFreezeController freezeController;
  final CardDetails details;
  final Future<bool> Function() onGetDetailsTapped;
  final VoidCallback? onWakeUpAccountTapped;

  @override
  State<CustomQCard> createState() => _CustomQCardState();
}

class _CustomQCardState extends State<CustomQCard> {
  CardFace _face = CardFace.front;
  Timer? _timer;
  bool isBack = true;
  double angle = 0;

  @override
  void initState() {
    _face = widget.initialCardFace ?? CardFace.front;
    super.initState();
  }

  // Widget _transitionBuilder(Widget widget, Animation<double> animation) {
  //   final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
  //
  //   return AnimatedBuilder(
  //     animation: rotateAnim,
  //     child: widget,
  //     builder: (context, widget) {
  //       final isUnder = (ValueKey(_face) != widget!.key);
  //       var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.006;
  //       tilt *= isUnder ? -1.0 : 1.0;
  //       final value =
  //           isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
  //
  //       return Transform(
  //         transform: (Matrix4.rotationY(value)..setEntry(3, 0, tilt)),
  //         child: widget,
  //         alignment: Alignment.center,
  //       );
  //     },
  //   );
  // }

  void _flipCard() {
    setState(() {
      if (_face == CardFace.front) {
        _face = CardFace.back;
        angle = (angle + pi) % (2 * pi);
        isBack = false;
        if (widget.enableAutoFlipBack) _startTimer();
      } else {
        _face = CardFace.front;
        angle = (angle + pi) % (2 * pi);
        isBack = true;
        _cancelTimer();
      }
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(widget.flipBackTime, (timer) => _flipCard());
  }

  void _cancelTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: angle),
        duration: const Duration(milliseconds: 800),
        curve: Curves.elasticInOut,
        builder: (BuildContext context, double val, __) {
          if (val >= (pi / 10)) {
            isBack = false;
          } else {
            isBack = true;
          }
          return SizedBox(
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.003)
                ..rotateY(val),
              child: isBack
                  ? FrontView(
                      labelWakeupAccount: widget.labelWakeUpAccount,
                      isGreyCard: widget.isGreyCard,
                      showWakeUpIcon: widget.showWakeupIcon,
                      label: widget.label,
                      showIcon: widget.showEye,
                      cardNumber: widget.details.frontCardNumber,
                      controller: widget.freezeController,
                      showCardDetails: widget.isCardDetailShow,
                      onTap: () async {
                        if (!widget.showWakeupIcon) {
                          if (await widget.onGetDetailsTapped.call()) {
                            _flipCard();
                          }
                        } else {
                          widget.onWakeUpAccountTapped?.call();
                        }
                      },
                    )
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.003)
                        ..rotateY(pi),
                      child: BackView(
                        controller: widget.freezeController,
                        label: widget.label,
                        showIcon: widget.showEye,
                        onActionTap: _flipCard,
                        onChildTap: widget.onCopy,
                        cardNumber: widget.details.cardNumber,
                        expiryDate: widget.details.expiryDate ?? '',
                        cvvCode: widget.details.cvvCode ?? '',
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
