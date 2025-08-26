class Deal {
  final String store;
  final String item;
  final double price;
  final double? oldPrice;
  const Deal({
    required this.store,
    required this.item,
    required this.price,
    this.oldPrice,
  });
}

class Meal {
  final String name;
  final double price;
  final int protein;
  final int calories;
  final List<String> tags;
  const Meal({
    required this.name,
    required this.price,
    required this.protein,
    required this.calories,
    this.tags = const [],
  });
}

class Workout {
  final String title;
  final String goal;
  final int minutes;
  final int intensity; // 1-3
  const Workout({
    required this.title,
    required this.goal,
    required this.minutes,
    required this.intensity,
  });
}

final mockDeals = <Deal>[
  Deal(store: 'Market', item: 'Apples', price: 2.5, oldPrice: 3.0),
  Deal(store: 'Shop', item: 'Oats', price: 4.0),
];

final mockMeals = <Meal>[
  Meal(name: 'Chicken Salad', price: 5.5, protein: 30, calories: 320, tags: ['quick']),
  Meal(name: 'Veggie Bowl', price: 4.2, protein: 15, calories: 280, tags: ['veggie']),
];

final mockWorkouts = <Workout>[
  Workout(title: 'HIIT Blast', goal: 'Fat loss', minutes: 20, intensity: 3),
  Workout(title: 'Yoga Flow', goal: 'Recovery', minutes: 30, intensity: 1),
];
