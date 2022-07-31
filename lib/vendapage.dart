import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/cores.dart';
import 'package:flutter_application_1/ChangeNotifiers.dart';
import 'gerenciadorpage.dart';

class VendaPage extends StatefulWidget {
  const VendaPage({Key? key}) : super(key: key);

  @override
  State<VendaPage> createState() => _VendaPageState();
}

class _VendaPageState extends State<VendaPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countState.count.clear();
    for (int c = 0; c < produtos.length; c++) {
      countState.count.add(ValueNotifier(0));
    }
    ;
  }

  List<Map> transacoes = [];
  List<String> nomesVendidos = [];
  List<String> categoriasVendidos = [];
  List<int> quantidadesVendidos = [];
  List<int> precoVendidos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: corAlternativa(),
        title: Text('Carrinho de Compras'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 15,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: produtos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: corAlternativa(),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: [
                              Text.rich(
                                TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: 'Produto: ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      )),
                                  TextSpan(
                                      text: produtos[index]['nome'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white)),
                                ]),
                              ),
                              Text.rich(
                                TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: 'Preço: ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      )),
                                  TextSpan(
                                      text: 'R\$' +
                                          produtos[index]['preco'].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white)),
                                ]),
                              ),
                              Text.rich(
                                TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: 'Estoque: ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      )),
                                  TextSpan(
                                      text:
                                          produtos[index]['estoque'].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white)),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: (() {
                                if (countState.count[index].value > 0) {
                                  countState.decrement(index);
                                }
                              }),
                              icon: Icon(
                                Icons.exposure_neg_1,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: ValueListenableBuilder(
                              valueListenable: countState.count[index],
                              builder: (context, int count, _) => Container(
                                  color: Colors.white,
                                  height: 30,
                                  child: Center(
                                      child: Text(
                                    count.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )))),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: (() {
                                if (countState.count[index].value <
                                    produtos[index]['estoque']) {
                                  countState.increment(index);
                                }
                              }),
                              icon: Icon(
                                Icons.plus_one,
                              )),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(corAlternativa()),
                ),
                onPressed: (() {
                  //Reseta as variáveis da transação
                  nomesVendidos.clear();
                  quantidadesVendidos.clear();
                  precoVendidos.clear();

                  //Percorre cada produto
                  for (int c = 0; c < produtos.length; c++) {
                    //Remove produtos vendidos do estoque
                    produtos[c]['estoque'] -= countState.count[c].value;
                    //Adiciona ganhos ao saldo
                    SaldoState.saldo.value +=
                        produtos[c]['preco'] * countState.count[c].value;
                    //Adiciona as informações da transação para cada produto vendido
                    if (countState.count[c].value > 0) {
                      nomesVendidos.add(produtos[c]['nome']);
                      categoriasVendidos.add(produtos[c]['categoria']);
                      quantidadesVendidos.add(countState.count[c].value);
                      precoVendidos.add(produtos[c]['preco']);
                    }
                  }
                  //Adiciona a transação com as informações da venda
                  transacoes.add({
                    'data': DateTime.now(),
                    'nomes': nomesVendidos,
                    'categorias': categoriasVendidos,
                    'quantidades': quantidadesVendidos,
                    'precos': precoVendidos
                  });
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/gerenciador', (Route<dynamic> route) => false);
                }),
                child: Text(
                  'Finalizar Venda',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
