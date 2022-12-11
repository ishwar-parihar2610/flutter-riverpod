/// simple riverpod implementation

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
final currentDate = Provider<DateTime>((ref) {
  return DateTime.now();
});

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build called");
    final date=ref.watch(currentDate);
    return Scaffold(
      appBar: AppBar(
        title: Text("Hookes Riverpod"),
      ),
      body: Center(
        child: Text(
          date.toIso8601String(),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}