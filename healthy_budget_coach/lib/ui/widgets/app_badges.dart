import 'package:flutter/material.dart';

class AppBadge extends StatelessWidget {
  final String label;
  const AppBadge(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Chip(label: Text(label)),
    );
  }
}
