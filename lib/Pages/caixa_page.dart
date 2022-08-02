import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Assets/change_notifiers.dart';
import 'package:flutter_application_1/Assets/cores.dart';
import 'gerenciador_page.dart';

//Valor total dos produtos em estoque
double estoqueTotal = 0;
//Versão string do valor total dos produtos em estoque
//para passar para o text com 2 casas decimais
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
    //reseta o a variável
    estoqueTotal = 0;
    //adiciona o valor total de cada produto em estoque
    for (int c = 0; c < produtos.length; c++) {
      estoqueTotal += produtos[c]['preco'] * produtos[c]['estoque'];
    }
    //transforma em string com 2 casas decimais
    estoqueTotalF = estoqueTotal.toStringAsFixed(2);
  }

  //Estilo dos textos dos valores
  TextStyle valores = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  //Valor que o saldo será alterado
  double valorModificado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestão de Caixa'),
        backgroundColor: corPrincipal(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Gráficos',
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
                    //botão de retirar dinheiro do caixa
                    ElevatedButton(
                        style: ButtonStyle(
                          //arredondamento das bordas
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              corPrincipal()),
                          overlayColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                        //Telinha para retirar dinheiro do cixa
                        onPressed: () => showDialog(
                            //não fechar clicando fora
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
                                    //teclado numérico
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      //retirar o que não pode entrar na variável
                                      value = value.replaceAll('-', '');
                                      value = value.replaceAll(' ', '');
                                      value = value.replaceAll(',', '.');
                                      try {
                                        //adiciona valor na variavel
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
                                    //botão de cancelar
                                    TextButton(
                                        onPressed: () {
                                          //reseta variavel
                                          valorModificado = 0;
                                          //fecha a telinha
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Cancelar',
                                          style: TextStyle(
                                              color: corAlternativa()),
                                        )),
                                    //botão de retirar
                                    TextButton(
                                        onPressed: () {
                                          //retira do saldo e adiciona dos retirados
                                          SaldoState.decrement(valorModificado);
                                          RetiradaState.increment(
                                              valorModificado);
                                          //reseta a variável
                                          valorModificado = 0;
                                          //fecha a telinha
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
                    //Saldo
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
                    //botão de aportes
                    ElevatedButton(
                        style: ButtonStyle(
                          //arredondamento do botão
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
                          //não fechar quando tocar fora
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
                                //remover o que não pode entrar na variável
                                value = value.replaceAll('-', '');
                                value = value.replaceAll(' ', '');
                                value = value.replaceAll(',', '.');
                                try {
                                  //adicionar valor na variável
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
                                    //reseta variável
                                    valorModificado = 0;
                                    //fecha a telinha
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Cancelar',
                                    style: TextStyle(
                                        color: corAlternativa()),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    //adiciona no saldo e nos reforços
                                    SaldoState.increment(valorModificado);
                                    ReforcosState.increment(
                                        valorModificado);
                                    //reseta variável
                                    valorModificado = 0;
                                    //fecha a telinha
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
                    //Valor total do estoque
                    Text('Total do Estoque \$' + estoqueTotalF, style: valores),
                    //Retiradas
                    ValueListenableBuilder(
                        valueListenable: RetiradaState.saldo,
                        builder: (context, double saldo, _) => Text(
                            'Retiradas \$' + saldo.toStringAsFixed(2),
                            style: valores)),
                    //Aportes
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
