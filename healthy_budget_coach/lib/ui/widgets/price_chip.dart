import 'package:flutter/material.dart';
import '../../core/ui/formatters.dart';

class PriceChip extends StatelessWidget {
  final double price;
  final double? oldPrice;
  const PriceChip({super.key, required this.price, this.oldPrice});

  @override
  Widget build(BuildContext context) {
    final current = priceFormatter(price);
    final old = oldPrice != null ? priceFormatter(oldPrice!) : null;
    final percent = oldPrice != null ? (((oldPrice! - price) / oldPrice!) * 100).round() : null;
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(current, semanticsLabel: 'price $current'),
          if (old != null) ...[
            const SizedBox(width: 4),
            Text(old, style: const TextStyle(decoration: TextDecoration.lineThrough)),
            if (percent != null) ...[
              const SizedBox(width: 4),
              Text('-$percent%'),
            ]
          ]
        ],
      ),
    );
  }
}
