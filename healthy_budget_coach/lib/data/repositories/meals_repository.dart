import '../mock_data.dart';

class MealsRepository {
  Stream<List<Meal>> listMeals() async* {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    yield mockMeals;
  }

  Future<List<Meal>> filterByTags(List<String> tags) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return mockMeals.where((m) => tags.every(m.tags.contains)).toList();
  }

  Future<List<Meal>> suggestSwaps(Meal oldMeal) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return mockMeals.where((m) => m != oldMeal).toList();
  }
}
