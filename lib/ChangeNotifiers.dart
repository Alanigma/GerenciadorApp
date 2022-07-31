import 'package:flutter/material.dart';
import 'package:flutter_application_1/gerenciadorpage.dart';

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

class Saldo extends ChangeNotifier {
  ValueNotifier<double> saldo = ValueNotifier(0);

  increment(double valor) {
    saldo.value += valor;
  }

  decrement(double valor) {
    saldo.value -= valor;
  }
}

final SaldoState = Saldo();

class Retirada extends ChangeNotifier {
  ValueNotifier<double> saldo = ValueNotifier(0);

  increment(double valor) {
    saldo.value += valor;
  }

  decrement(double valor) {
    saldo.value -= valor;
  }
}

final RetiradaState = Retirada();

class Reforcos extends ChangeNotifier {
  ValueNotifier<double> saldo = ValueNotifier(0);

  increment(double valor) {
    saldo.value += valor;
  }

  decrement(double valor) {
    saldo.value -= valor;
  }
}

final ReforcosState = Reforcos();