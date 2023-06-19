import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';

import 'transaction_block.dart';

class TransactionBlockList extends StatefulWidget {
  const TransactionBlockList({
    Key? key,
    required this.children,
    this.initiallyExpanded = false,
    required this.selectedChild,
    this.onTap,
  }) : super(key: key);

  final List<TransactionBlock> children;
  final int selectedChild;
  final bool initiallyExpanded;
  final Function(int index)? onTap;

  @override
  State<TransactionBlockList> createState() => _TransactionBlockListState();
}

class _TransactionBlockListState extends State<TransactionBlockList> {
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _expanded = widget.initiallyExpanded;
    });
  }

  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_expanded) {
      return widget.children.elementAt(widget.selectedChild).copyWith(
            hasChildren: true,
            onTap: _toggleExpanded,
          );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 2,
            color: ToolkitColors.shadowColor,
          )
        ],
      ),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(color: ToolkitColors.greyLight, height: 1),
          itemCount: widget.children.length,
          itemBuilder: (context, index) => widget.children.elementAt(index).copyWith(
                isElevated: false,
                hasTrailing: false,
                onTap: () {
                  _toggleExpanded();
                  widget.onTap?.call(index);
                },
              ),
        ),
      ),
    );
  }
}
