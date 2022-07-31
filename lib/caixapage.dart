import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/ChangeNotifiers.dart';
import 'package:flutter_application_1/cores.dart';
import 'gerenciadorpage.dart';

double estoqueTotal = 0;
String estoqueTotalF = '';

class CaixaPage extends StatefulWidget {
  const CaixaPage({Key? key}) : super(key: key);

  @override
  State<CaixaPage> createState() => _CaixaPageState();
}

class _CaixaPageState extends State<CaixaPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    estoqueTotal = 0;
    for (int c = 0; c < produtos.length; c++) {
      estoqueTotal += produtos[c]['preco'] * produtos[c]['estoque'];
    }
    estoqueTotalF = estoqueTotal.toStringAsFixed(2);
  }

  TextStyle valores = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  double valorModificado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestão de Caixa'),
        backgroundColor: corPrincipal(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: corPrincipal(),
        hoverColor: Colors.purpleAccent,
        splashColor: corSecundaria(),
        foregroundColor: corSecundaria(),
        onPressed: () {
          //Navigator.of(context).pushNamed('/add');
        },
        child: Icon(Icons.pie_chart),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                color: corSecundaria(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                corPrincipal()),
                            overlayColor:
                                MaterialStateProperty.all<Color>(Colors.black)),
                        onPressed: () => showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  elevation: 40,
                                  backgroundColor: corSecundaria(),
                                  title: Text(
                                    'Qual o Valor do Saque?',
                                    style: TextStyle(color: corPrincipal()),
                                  ),
                                  content: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      value = value.replaceAll('-', '');
                                      value = value.replaceAll(' ', '');
                                      value = value.replaceAll(',', '.');
                                      try {
                                        valorModificado = double.parse(value);
                                      } catch (erro) {
                                        print(erro);
                                      }
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.purple)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.purpleAccent,
                                        ))),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          valorModificado = 0;
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Cancelar',
                                          style: TextStyle(
                                              color: corAlternativa()),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          SaldoState.decrement(valorModificado);
                                          RetiradaState.increment(
                                              valorModificado);
                                          valorModificado = 0;
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Retirar',
                                          style: TextStyle(color: Colors.green),
                                        )),
                                  ],
                                )),
                        child: Icon(
                          Icons.remove,
                          color: corSecundaria(),
                        )),
                    Container(
                      margin: new EdgeInsets.symmetric(horizontal: 35.0),
                      child: ValueListenableBuilder(
                        valueListenable: SaldoState.saldo,
                        builder: (context, double saldo, _) => Text(
                            'Saldo: \$' + saldo.toStringAsFixed(2),
                            style: TextStyle(
                                color: corPrincipal(),
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                corPrincipal()),
                            overlayColor:
                                MaterialStateProperty.all<Color>(Colors.black)),
                        onPressed: () => showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  elevation: 40,
                                  backgroundColor: corSecundaria(),
                                  title: Text(
                                    'Quando dinheiro deseja adicionar ao caixa?',
                                    style: TextStyle(color: corPrincipal()),
                                  ),
                                  content: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      value = value.replaceAll('-', '');
                                      value = value.replaceAll(' ', '');
                                      value = value.replaceAll(',', '.');
                                      try {
                                        valorModificado = double.parse(value);
                                      } catch (erro) {
                                        print(erro);
                                      }
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.purple)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.purpleAccent,
                                        ))),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          valorModificado = 0;
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Cancelar',
                                          style: TextStyle(
                                              color: corAlternativa()),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          SaldoState.increment(valorModificado);
                                          ReforcosState.increment(
                                              valorModificado);
                                          valorModificado = 0;
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Adicionar',
                                          style: TextStyle(color: Colors.green),
                                        )),
                                  ],
                                )),
                        child: Icon(
                          Icons.add,
                          color: corSecundaria(),
                        )),
                  ],
                )),
          ),
          Expanded(
              flex: 9,
              child: Container(
                child: Column(
                  children: [
                    Text('Total do Estoque \$' + estoqueTotalF,
                        style: valores),                    
                    ValueListenableBuilder(
                        valueListenable: RetiradaState.saldo,
                        builder: (context, double saldo, _) => Text(
                            'Retiradas \$' + saldo.toStringAsFixed(2),
                            style: valores)),
                    ValueListenableBuilder(
                        valueListenable: ReforcosState.saldo,
                        builder: (context, double saldo, _) => Text(
                            'Reforços \$' + saldo.toStringAsFixed(2),
                            style: valores)),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
