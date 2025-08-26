import 'package:flutter/material.dart';

class CoachCard extends StatelessWidget {
  final IconData icon;
  final String message;
  final VoidCallback? onTap;
  const CoachCard({super.key, required this.icon, required this.message, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(message),
        trailing: onTap != null ? FilledButton(onPressed: onTap, child: const Text('Go')) : null,
      ),
    );
  }
}
