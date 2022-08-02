import 'package:flutter/material.dart';

//Contador de itens no carrinho
class Counter extends ChangeNotifier {
  //Valores do Contador
  final List<ValueNotifier<int>> count = [ValueNotifier(0)];

  //Incremento do Contador
  increment(index) {
    count[index].value++;
  }

  //Decremento do Contador
  decrement(index) {
    count[index].value--;
  }
}

//Instaciar o contador
final countState = Counter();

//Saldo Atual da Conta
class Saldo extends ChangeNotifier {
  //Valor do Saldo
  ValueNotifier<double> saldo = ValueNotifier(0);

  //Incremento do Contador
  increment(double valor) {
    saldo.value += valor;
  }

  //Decremento do Contador
  decrement(double valor) {
    saldo.value -= valor;
  }
}

//Instanciar o Saldo
final SaldoState = Saldo();


//Quantidade de Dinheiro Retirado
class Retirada extends ChangeNotifier {
  //Valor da Retirada
  ValueNotifier<double> saldo = ValueNotifier(0);

  //Incremento do Contador
  increment(double valor) {
    saldo.value += valor;
  }

  //Decremento do Contador
  decrement(double valor) {
    saldo.value -= valor;
  }
}

//Instanciar a Retirada
final RetiradaState = Retirada();

//Quantidade de Dinheiro Aportado
class Reforcos extends ChangeNotifier {
  //Valor dos Aportes
  ValueNotifier<double> saldo = ValueNotifier(0);

  //Incremento do Contador
  increment(double valor) {
    saldo.value += valor;
  }

  //Decremento do Contador
  decrement(double valor) {
    saldo.value -= valor;
  }
}

//Instanciar os Reforcos
final ReforcosState = Reforcos();
