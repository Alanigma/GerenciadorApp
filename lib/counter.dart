import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  final List<ValueNotifier<int>> count = [ValueNotifier(0)];

  increment(index) {
    count[index].value++;
  }

  decrement(index) {
    count[index].value--;
  }
}

final countState = Counter();
