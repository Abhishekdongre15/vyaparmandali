import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';

import 'simple_transaction_block_state.dart';

class SimpleTransactionBlock extends StatelessWidget {
  const SimpleTransactionBlock({
    Key? key,
    required this.label,
    this.status,
    this.amount,
    this.state = SimpleTransactionBlockState.normal,
    this.onTap,
  }) : super(key: key);

  final String label;
  final String? status;
  final SimpleTransactionBlockState state;
  final String? amount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 1),
            color: ToolkitColors.shadowColor,
            blurRadius: 4,
            spreadRadius: -1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Card(
          margin: EdgeInsets.zero,
          color: ToolkitColors.white,
          child: InkWell(
            onTap: onTap,
            child: Ink(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                    left: 16,
                    right:
                        state == SimpleTransactionBlockState.credit ? 14 : 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildLabel(),
                    if (amount != null) _trailing(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _trailing() {
    if (state == SimpleTransactionBlockState.debit) {
      return Row(
        children: [
          _buildDeclined(),
          _buildAmount(newAmount: '- $amount'.trim()),
        ],
      );
    }

    if (state == SimpleTransactionBlockState.credit) {
      return Container(
        decoration: BoxDecoration(
          color: ToolkitColors.lightPrimary,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: _buildAmount(newAmount: '+ $amount'.trim()),
      );
    }

    return _buildAmount();
  }

  Padding _buildDeclined() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Visibility(
        visible: status != null && status!.isNotEmpty,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          // child: const Text('Declined'),
          child: Text(status ?? ''),
          decoration: BoxDecoration(
            color: ToolkitColors.lightError,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Text _buildAmount({String? newAmount}) => Text(newAmount ?? amount!,
      style: ToolkitTypography.body3B.copyWith(
          color: state == SimpleTransactionBlockState.declined
              ? ToolkitColors.greyDark
              : null));

  Text _buildLabel() => Text(label, style: ToolkitTypography.body3B);
}
