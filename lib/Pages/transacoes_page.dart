import 'package:flutter/material.dart';
import 'package:flutter_application_1/Assets/cards.dart';
import 'package:flutter_application_1/Assets/cores.dart';
import 'venda_page.dart';
import 'dart:math' as math;

class TransacoesPage extends StatefulWidget {
  const TransacoesPage({Key? key}) : super(key: key);

  @override
  State<TransacoesPage> createState() => _TransacoesPageState();
}

class _TransacoesPageState extends State<TransacoesPage> {
  TextStyle estiloFonte =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendas Realizadas'),
        backgroundColor: corPrincipal(),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: transacoes.length,
          itemBuilder: (_, int index) {
            double total = 0;
            var data = transacoes[index]['data'];
            List<String> nomes = transacoes[index]['nomes'];
            List<String> categorias = transacoes[index]['categorias'];
            List<int> quantidades = transacoes[index]['quantidades'];
            List<double> precos = transacoes[index]['precos'];
            for (int c = 0; c < quantidades.length; c++) {
              total += quantidades[c] * precos[c];
            }
            return Container(
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0),
              child: Column(
                children: [
                  Text('${data.day}/${data.month}/${data.year}',
                      style: estiloFonte),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: nomes.length,
                      itemBuilder: (_, int index2) {
                        return CardProdutoTransacao(
                            index2,
                            nomes[index2],
                            categorias[index2],
                            quantidades[index2],
                            precos[index2]);
                      }),
                  Text(
                    'Total: \$${total.toStringAsFixed(2)}',
                    style: estiloFonte,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
