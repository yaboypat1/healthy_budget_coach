import 'package:flutter/material.dart';
import '../../core/ui/formatters.dart';

class BudgetMeter extends StatelessWidget {
  final double spent;
  final double cap;
  const BudgetMeter({super.key, required this.spent, required this.cap});

  @override
  Widget build(BuildContext context) {
    final ratio = (spent / cap).clamp(0.0, 1.0);
    Color color;
    if (ratio < 0.5) {
      color = Colors.green;
    } else if (ratio < 0.8) {
      color = Colors.amber;
    } else {
      color = Colors.red;
    }
    return Tooltip(
      message: '${priceFormatter(spent)} / ${priceFormatter(cap)}',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(value: ratio, color: color),
          const SizedBox(height: 4),
          Text('${(ratio * 100).toStringAsFixed(0)}% used',
              style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
