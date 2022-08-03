import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Pages/gerenciador_page.dart';
import 'cores.dart';

Widget CardProdutoTransacao(
    int index, String nome, String categoria, int quantidade, double preco) {
  return Card(
      elevation: 20,
      //arredondamento dos cards
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      color: corSecundaria(),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              children: [
                //Nome do produto
                Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Produto: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    TextSpan(
                        text: nome,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.purple)),
                  ]),
                ),
                //Categoria do produto
                Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Categoria: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    TextSpan(
                        text: categoria,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.purple)),
                  ]),
                ),
                //Preço do produto
                Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Preço: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    TextSpan(
                        text: 'R\$${preco.toString()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.purple)),
                  ]),
                ),
                //Estoque do produto
                Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Quantide: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    TextSpan(
                        text: quantidade.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.purple)),
                  ]),
                ),
                Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Subtotal: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    TextSpan(
                        text: 'R\$ ${(preco * quantidade).toString()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.purple)),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ));
}
