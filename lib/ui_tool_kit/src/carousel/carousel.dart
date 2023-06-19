import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/dot_indicator/dot_indicator.dart';

class QorbitalCarousel extends StatefulWidget {
  const QorbitalCarousel({
    Key? key,
    this.height,
    this.onPageChanged,
    required this.items,
    this.initialPage,
    this.viewportFraction,
  }) : super(key: key);

  final double? height;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final List<String> items;
  final int? initialPage;
  final double? viewportFraction;

  @override
  State<QorbitalCarousel> createState() => _QorbitalCarouselState();
}

class _QorbitalCarouselState extends State<QorbitalCarousel> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialPage ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            initialPage: _currentIndex,
            viewportFraction: widget.viewportFraction ?? 0.83,
            enableInfiniteScroll: false,
            autoPlay: false,
            enlargeCenterPage: false,
            height: widget.height ?? MediaQuery.of(context).size.height * 0.24,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
              widget.onPageChanged?.call(index, reason);
            },
          ),
          items: widget.items
              .map((e) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 174,
                      width: 279,
                      padding: EdgeInsets.zero,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 24,
                            spreadRadius: 0,
                            color: ToolkitColors.shadowColor,
                          ),
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 8,
                            spreadRadius: 0,
                            color: ToolkitColors.shadowColor,
                          ),
                        ],
                      ),
                      child: Image.network(
                        e,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => ToolkitAssets.iconCardBackView.widget(),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress?.expectedTotalBytes == null) return child;

                          return CircularProgressIndicator(
                            value: loadingProgress!.expectedTotalBytes! / loadingProgress.cumulativeBytesLoaded,
                          );
                        },
                      ),
                    ),
                  ))
              .toList(),
        ),
        DotIndicator(
          pages: widget.items.length,
          selected: _currentIndex,
        ),
      ],
    );
  }
}
