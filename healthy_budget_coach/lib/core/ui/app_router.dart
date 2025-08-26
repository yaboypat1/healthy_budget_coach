import 'package:flutter/material.dart';
import '../../ui/screens/screen_dashboard.dart';
import '../../ui/screens/screen_meals.dart';
import '../../ui/screens/screen_deals.dart';
import '../../ui/screens/screen_workouts.dart';
import '../../ui/screens/screen_assistant.dart';

enum AppRoute { dashboard, meals, deals, workouts, assistant }

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case 'dashboard':
        return _build(const DashboardScreen());
      case 'meals':
        return _build(const MealsScreen());
      case 'deals':
        return _build(const DealsScreen());
      case 'workouts':
        return _build(const WorkoutsScreen());
      case 'assistant':
        return _build(const AssistantScreen());
      default:
        return _build(const DashboardScreen());
    }
  }

  static MaterialPageRoute _build(Widget child) =>
      MaterialPageRoute(builder: (_) => child);
}
