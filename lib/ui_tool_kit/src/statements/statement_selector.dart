import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

class ExpansionTileUI extends StatefulWidget {
  const ExpansionTileUI({
    Key? key,
    required this.title,
    this.animationDuration,
    this.initiallyExpanded = false,
    required this.children,
    this.scrollController,
    this.childTapped,
  }) : super(key: key);

  final String title;
  final Duration? animationDuration;
  final bool initiallyExpanded;
  final List<String> children;
  final ScrollController? scrollController;
  final Function(int index)? childTapped;

  @override
  _ExpansionTileUIState createState() => _ExpansionTileUIState();
}

class _ExpansionTileUIState extends State<ExpansionTileUI> with SingleTickerProviderStateMixin {
  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  final Animatable<double> _halfTween = Tween<double>(begin: 0.5, end: 0.0);

  late AnimationController _animationController;
  late Animation<double> _iconTurns;
  late ScrollController _scrollController;

  bool _isExpanded = false;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 200),
      vsync: this,
    );
    _scrollController = widget.scrollController ?? ScrollController();
    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));
    setState(() {
      _isExpanded = widget.initiallyExpanded;
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: ToolkitColors.shadowColor,
            offset: Offset(0, 1),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        child: _isExpanded ? _buildContent() : _buildTitle(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildTitle(),
        const Divider(height: 1, color: ToolkitColors.greyMedium),
        ListView.separated(
          controller: _scrollController,
          shrinkWrap: true,
          itemCount: widget.children.length,
          separatorBuilder: (context, index) => const Divider(height: 1, color: ToolkitColors.greyMedium),
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(
              onTap: () => widget.childTapped?.call(index),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.children.elementAt(index),
                    style: ToolkitTypography.body2B.copyWith(color: ToolkitColors.greyDark),
                  ),
                  ToolkitAssets.iconIosForward44.widget(color: ToolkitColors.greyDark),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return _buildItem(
      onTap: _onExpansionChanged,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: ToolkitTypography.body2A.copyWith(color: ToolkitColors.secondary),
          ),
          RotationTransition(
            turns: _iconTurns,
            child: Transform.rotate(
              angle: 0,
              child: ToolkitAssets.iconIosUp44.widget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required VoidCallback onTap,
    required Widget child,
  }) {
    return SizedBox(
      height: 48,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: child,
          ),
        ),
      ),
    );
  }

  _onExpansionChanged() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }
}
