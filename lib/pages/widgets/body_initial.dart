import 'package:flutter/material.dart';

class BodyInitial extends StatelessWidget {
  const BodyInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('there is no weather 😔 start', style: TextStyle(fontSize: 30)),
          Text('searching now 🔍', style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
