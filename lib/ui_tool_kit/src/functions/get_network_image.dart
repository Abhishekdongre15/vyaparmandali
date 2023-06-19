import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vyaparmandali/ui_tool_kit/src/uitoolkit.dart';


Widget getNetworkImage(
  String url, {
  Widget? onError,
  double? height,
  double? width,
}) {
  bool _isSVG = url.endsWith('.svg');
  if (_isSVG) {
    return SvgPicture.network(
      url,
      height: height,
      width: width,
      placeholderBuilder: (context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: UIToolkit.circleIndicator(strokeWidth: 3),
        ),
      ),
    );
  }

  return Image.network(
    url,
    height: height,
    width: width,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;
      return Padding(
        padding: const EdgeInsets.all(15),
        child: UIToolkit.circleIndicator(strokeWidth: 3),
      );
    },
    errorBuilder: (context, error, stackTrace) {
      // TODO add crashlytics logs
      return onError ?? Container();
    },
  );
}
