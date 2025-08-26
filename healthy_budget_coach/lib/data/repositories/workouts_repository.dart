import '../mock_data.dart';

class WorkoutsRepository {
  Stream<List<Workout>> listWorkouts() async* {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    yield mockWorkouts;
  }

  Future<List<Workout>> filterByGoal(String goal) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return mockWorkouts.where((w) => w.goal == goal).toList();
  }

  Future<Workout?> quickStart() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return mockWorkouts.isNotEmpty ? mockWorkouts.first : null;
  }
}
