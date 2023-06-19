import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';

import '../../uitoolkit.dart';


class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    Key? key,
    required this.title,
    this.children = const [],
    this.hideHeaderOnExpanded = false,
  }) : super(key: key);

  final String title;
  final List<Widget> children;
  final bool hideHeaderOnExpanded;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> with SingleTickerProviderStateMixin {
  late final double _minChildSize = 61 / MediaQuery.of(context).size.height;
  final double _maxChildSize = 1;
  final DraggableScrollableController _controller = DraggableScrollableController();
  bool showHeader = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: DraggableScrollableSheet(
        controller: _controller,
        initialChildSize: _minChildSize,
        minChildSize: _minChildSize,
        maxChildSize: _maxChildSize,
        builder: (context, scrollController) {
          if (widget.hideHeaderOnExpanded) {
            if (_controller.size == 1.0) {
              showHeader = false;
            } else {
              showHeader = true;
            }
          }

          return Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -10),
                  color: ToolkitColors.shadowColor,
                  spreadRadius: -4,
                  blurRadius: 8,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  if (showHeader) ...[
                    _SliverHeader(title: widget.title),
                    const SliverToBoxAdapter(child: SizedBox(height: 10))
                  ],
                  _ContentHeader(scrollController: scrollController),
                  SliverFillRemaining(
                    hasScrollBody: true,
                    fillOverscroll: true,
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(),
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: widget.children.length,
                        itemBuilder: (BuildContext context, int index) {
                          return widget.children.elementAt(index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ContentHeader extends StatelessWidget {
  const _ContentHeader({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      backgroundColor: ToolkitColors.white,
      elevation: 0,
      title: const _DragHandle(margin: EdgeInsets.zero),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      leading: IconButton(
        icon: ToolkitAssets.iconIosDown44.widget(),
        onPressed: () {
          scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
          );
        },
      ),
    );
  }
}

class _SliverHeader extends StatelessWidget {
  const _SliverHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      backgroundColor: ToolkitColors.white,
      elevation: 0,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _DragHandle(),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 10),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: ToolkitTypography.body3A.copyWith(
                color: ToolkitColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle({
    Key? key,
    this.margin,
  }) : super(key: key);

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 5,
      margin: margin ?? const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: ToolkitColors.greyMediumDark,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
