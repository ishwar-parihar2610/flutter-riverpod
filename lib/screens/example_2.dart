import 'package:flutter/material.dart';

void testIt() {
  final int? int1 = 1;
  final int int2 = 1;
  final result = int1 + int2;
}

extension OptionalInfixAddition<T extends num> on T? {
  T? operator +(T? other) {
    final shadow = this ?? other;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }
}

class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Hookes Riverpod"),
    ));
  }
}
