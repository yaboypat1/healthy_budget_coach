import 'dart:async';

import '../mock_data.dart';

class DealsRepository {
  Future<List<Deal>> fetchDeals() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return mockDeals;
  }

  Future<List<Deal>> refresh() async => fetchDeals();

  Future<Map<String, List<Deal>>> groupByStore() async {
    final deals = await fetchDeals();
    final map = <String, List<Deal>>{};
    for (final d in deals) {
      map.putIfAbsent(d.store, () => []).add(d);
    }
    return map;
  }
}
