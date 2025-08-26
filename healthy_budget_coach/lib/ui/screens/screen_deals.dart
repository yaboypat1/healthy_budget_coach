import 'package:flutter/material.dart';
import '../../data/repositories/deals_repository.dart';
import '../../data/mock_data.dart';
import '../widgets/price_chip.dart';
import '../widgets/shimmer_box.dart';
import '../widgets/empty_state.dart';

class DealsScreen extends StatefulWidget {
  const DealsScreen({super.key});

  @override
  State<DealsScreen> createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> {
  final repo = DealsRepository();
  late Future<Map<String, List<Deal>>> _future;

  @override
  void initState() {
    super.initState();
    _future = repo.groupByStore();
  }

  Future<void> _refresh() async {
    setState(() {
      _future = repo.groupByStore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deals')),
      body: FutureBuilder<Map<String, List<Deal>>>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: ShimmerBox(height: 100, width: double.infinity));
          }
          final map = snapshot.data!;
          if (map.isEmpty) {
            return EmptyState(message: 'No deals', onRetry: _refresh);
          }
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: map.entries
                  .map((e) => _buildStoreSection(context, e.key, e.value))
                  .toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStoreSection(BuildContext context, String store, List<Deal> deals) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(store, style: Theme.of(context).textTheme.titleLarge),
        ...deals.map((d) => ListTile(
              title: Text(d.item),
              trailing: PriceChip(price: d.price, oldPrice: d.oldPrice),
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Selected ${d.item}')));
              },
            ))
      ],
    );
  }
}
