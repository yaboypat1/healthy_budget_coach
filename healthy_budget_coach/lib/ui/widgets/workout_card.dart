import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../core/ui/formatters.dart';
import 'app_badges.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;
  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    final intensityLabels = ['Low', 'Med', 'High'];
    final intensity = intensityLabels[(workout.intensity - 1).clamp(0, 2)];
    final kcalPerMin = (workout.intensity * 5);
    return Card(
      child: ListTile(
        title: Text(workout.title),
        subtitle: Text('${workout.goal} • ${kcalFormatter(kcalPerMin)} / min'),
        trailing: AppBadge(intensity),
      ),
    );
  }
}
