import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../data/repositories/meals_repository.dart';
import '../../core/ui/formatters.dart';
import 'price_chip.dart';
import 'shimmer_box.dart';

class SwapSheet extends StatefulWidget {
  final Meal meal;
  const SwapSheet({super.key, required this.meal});

  @override
  State<SwapSheet> createState() => _SwapSheetState();
}

class _SwapSheetState extends State<SwapSheet> {
  final repo = MealsRepository();
  late Future<List<Meal>> _future;

  @override
  void initState() {
    super.initState();
    _future = repo.suggestSwaps(widget.meal);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Meal>>(
      future: _future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: ShimmerBox(height: 80, width: double.infinity),
          );
        }
        final meals = snapshot.data!;
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, i) {
            final meal = meals[i];
            final priceDelta = widget.meal.price - meal.price;
            final proteinDelta = meal.protein - widget.meal.protein;
            final kcalDelta = meal.calories - widget.meal.calories;
            return ListTile(
              title: Text(meal.name),
              subtitle: Text(
                '${priceFormatter(priceDelta)} • ${macroFormatter(proteinDelta, 'protein')} • ${kcalFormatter(kcalDelta)}',
              ),
              trailing: PriceChip(price: meal.price),
              onTap: () => Navigator.pop(context, meal),
            );
          },
        );
      },
    );
  }
}
