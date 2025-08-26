import 'package:flutter/material.dart';
import '../../data/repositories/meals_repository.dart';
import '../../data/repositories/workouts_repository.dart';
import '../../data/mock_data.dart';
import '../widgets/budget_meter.dart';
import '../widgets/meal_card.dart';
import '../widgets/workout_card.dart';
import '../components/coach_card.dart';
import '../widgets/shimmer_box.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final mealsRepo = MealsRepository();
  final workoutsRepo = WorkoutsRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: RefreshIndicator(
        onRefresh: () async => setState(() {}),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const BudgetMeter(spent: 45, cap: 100),
            const SizedBox(height: 16),
            Text('Today\'s meals', style: Theme.of(context).textTheme.titleLarge),
            StreamBuilder<List<Meal>>(
              stream: mealsRepo.listMeals(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const ShimmerBox(height: 100, width: double.infinity);
                }
                return Column(
                  children:
                      snapshot.data!.map((m) => MealCard(meal: m)).toList(),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('Quick workouts', style: Theme.of(context).textTheme.titleLarge),
            StreamBuilder<List<Workout>>(
              stream: workoutsRepo.listWorkouts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const ShimmerBox(height: 80, width: double.infinity);
                }
                return Column(
                  children:
                      snapshot.data!.map((w) => WorkoutCard(workout: w)).toList(),
                );
              },
            ),
            const SizedBox(height: 16),
            const CoachCard(
              icon: Icons.savings,
              message: 'Swap expensive items for cheaper ones',
            ),
            const CoachCard(
              icon: Icons.fitness_center,
              message: 'Short daily workouts keep energy high',
            ),
          ],
        ),
      ),
    );
  }
}
