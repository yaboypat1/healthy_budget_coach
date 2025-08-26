import 'package:flutter/material.dart';
import '../../data/repositories/meals_repository.dart';
import '../../data/mock_data.dart';
import '../widgets/meal_card.dart';
import '../widgets/shimmer_box.dart';
import '../widgets/empty_state.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  final repo = MealsRepository();
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meals')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search meals'),
              onChanged: (v) => setState(() => query = v.toLowerCase()),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Meal>>(
              stream: repo.listMeals(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: ShimmerBox(height: 100, width: double.infinity));
                }
                final meals = snapshot.data!
                    .where((m) => m.name.toLowerCase().contains(query))
                    .toList();
                if (meals.isEmpty) {
                  return const EmptyState(message: 'No meals found');
                }
                return RefreshIndicator(
                  onRefresh: () async => setState(() {}),
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: meals.map((m) => MealCard(meal: m)).toList(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
