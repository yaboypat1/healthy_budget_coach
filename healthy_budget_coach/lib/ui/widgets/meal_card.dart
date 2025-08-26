import 'package:flutter/material.dart';
import '../../core/ui/formatters.dart';
import '../../data/mock_data.dart';
import 'price_chip.dart';
import 'swap_sheet.dart';
import 'app_badges.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(meal.name, style: Theme.of(context).textTheme.titleMedium)),
                PriceChip(price: meal.price),
              ],
            ),
            const SizedBox(height: 8),
            Text(macroFormatter(meal.protein, 'protein')),
            Text(kcalFormatter(meal.calories)),
            Wrap(children: meal.tags.map((t) => AppBadge(t)).toList()),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () async {
                  final swap = await showModalBottomSheet<Meal>(
                    context: context,
                    builder: (_) => SwapSheet(meal: meal),
                  );
                  if (swap != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Swapped with ${swap.name}')),
                    );
                  }
                },
                child: const Text('Cheaper swap'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
