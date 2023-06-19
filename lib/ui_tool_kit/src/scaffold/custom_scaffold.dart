import 'package:flutter/material.dart';

import '../../uitoolkit.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    Key? key,
    this.actions,
    this.headerTitle,
    required this.pageBackgroundColor,
    required this.child,
    this.controller,
    this.isPdf,
    this.onBack,
  }) : super(key: key);

  final List<Widget>? actions;
  final String? headerTitle;
  final Color? pageBackgroundColor;
  final Widget child;
  final ScrollController? controller;
  final bool? isPdf;
  final VoidCallback? onBack;

  @override
  CustomScaffoldState createState() => CustomScaffoldState();
}

class CustomScaffoldState extends State<CustomScaffold> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.actions != null) assert(widget.actions!.isNotEmpty);
    return Scaffold(
      backgroundColor: widget.pageBackgroundColor,
      body: CustomScrollView(
        shrinkWrap: widget.isPdf! ? true : false,
        physics: widget.isPdf! ? const NeverScrollableScrollPhysics() : const ClampingScrollPhysics(),
        slivers: [
          MediaQuery.removePadding(
            removeBottom: true,
            context: context,
            child: SliverAppBar(
              backgroundColor: widget.pageBackgroundColor,
              pinned: true,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Semantics(
                  child: ToolkitAssets.iconIosBack44.widget(
                    fit: BoxFit.none,
                    height: 0,
                    onTap: () {
                      if (widget.onBack != null) {
                        widget.onBack!.call();
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  label: "Close",
                  button: true,
                ),
              ),
            ),
          ),
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: SliverAppBar(
                toolbarHeight: 30,
                elevation: 5,
                pinned: true,
                centerTitle: false,
                backgroundColor: widget.pageBackgroundColor,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Semantics(
                    child: Text(
                      widget.headerTitle!,
                      style: ToolkitTypography.h2.copyWith(color: ToolkitColors.secondary),
                    ),
                    label: widget.headerTitle!,
                    header: true,
                  ),
                ),
                actions: _buildActions(),
              )),
          SliverFillRemaining(
            hasScrollBody: true,
            fillOverscroll: true,
            child: widget.child,
          )
        ],
      ),
    );
  }

  List<Widget>? _buildActions() {
    if (widget.actions != null) {
      List<Widget> _items = List.from(widget.actions!);
      Widget _last = _items.removeLast();
      return [
        ..._items,
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: _last,
        )
      ];
    }
  }
}
