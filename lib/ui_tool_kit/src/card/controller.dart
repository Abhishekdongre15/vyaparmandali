import 'package:flutter/material.dart';

class CardFreezeController extends ChangeNotifier {
  CardFreezeController([bool? isFrozen]) {
    _frozen = isFrozen ?? false;
    if (_frozen) {
      freeze();
    }
  }

  bool _frozen = false;
  double opacityLevel = 0;
  Duration animationDuration = const Duration(milliseconds: 500);
  AnimationController? _positionController;
  Animation<Offset>? _offsetAnimation;

  Animation<Offset>? get offsetAnimation => _offsetAnimation;
  set positionController(AnimationController controller) {
    _positionController = controller;
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.01),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _positionController!,
      curve: Curves.ease,
    ));
    notifyListeners();
  }

  void freeze() {
    _frozen = true;
    opacityLevel = 1.0;
    animationDuration = const Duration(seconds: 1);
    notifyListeners();
  }

  void unfreeze() {
    _frozen = false;
    changePosition();
    opacityLevel = 0.0;
    animationDuration = const Duration(milliseconds: 200);
    notifyListeners();
  }

  void changePosition() {
    if (_frozen) {
      _positionController?.forward();
    } else {
      _positionController?.reverse();
    }
  }
}
