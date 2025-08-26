import 'package:flutter/material.dart';
import '../../data/repositories/workouts_repository.dart';
import '../../data/mock_data.dart';
import '../widgets/workout_card.dart';
import '../widgets/shimmer_box.dart';
import '../widgets/empty_state.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  final repo = WorkoutsRepository();
  String goal = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workouts')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Goal'),
              items: const [
                DropdownMenuItem(value: '', child: Text('All')),
                DropdownMenuItem(value: 'Fat loss', child: Text('Fat loss')),
                DropdownMenuItem(value: 'Strength', child: Text('Strength')),
                DropdownMenuItem(value: 'Recovery', child: Text('Recovery')),
              ],
              onChanged: (v) => setState(() => goal = v ?? ''),
              value: goal,
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Workout>>(
              stream: repo.listWorkouts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: ShimmerBox(height: 80, width: double.infinity));
                }
                var list = snapshot.data!;
                if (goal.isNotEmpty) {
                  list = list.where((w) => w.goal == goal).toList();
                }
                if (list.isEmpty) {
                  return const EmptyState(message: 'No workouts');
                }
                return RefreshIndicator(
                  onRefresh: () async => setState(() {}),
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: list.map((w) => WorkoutCard(workout: w)).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final quick = await repo.quickStart();
          if (quick != null) {
            // show snackbar
            if (context.mounted) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Starting ${quick.title}')));
            }
          }
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
