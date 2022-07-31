import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'cores.dart';
import 'gerenciadorpage.dart';

class ListaProdutosPage extends StatefulWidget {
  const ListaProdutosPage({Key? key}) : super(key: key);

  @override
  State<ListaProdutosPage> createState() => _ListaProdutosPageState();
}

class _ListaProdutosPageState extends State<ListaProdutosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [          
          IconButton(
              onPressed: (() {
                Navigator.of(context).pushNamed('/venda');
              }),
              icon: Icon(Icons.sell, color: corSecundaria())),
        ],
        backgroundColor: corPrincipal(),
        title: Text('Gerenciador De Estoques'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: corPrincipal(),
        hoverColor: Colors.purpleAccent,
        splashColor: corSecundaria(),
        foregroundColor: corSecundaria(),
        onPressed: () {
          Navigator.of(context).pushNamed('/add');
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: corPrincipal(),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            color: corSecundaria(),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: (() {
                        setState(() {
                          produtos.removeAt(index);
                        });
                      }),
                      icon: Icon(
                        Icons.cancel_rounded,
                        color: Colors.pink,
                      ),
                    )),
                Expanded(
                  flex: 8,
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
                                  color: Colors.purple)),
                        ]),
                      ),
                      Text.rich(
                        TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'Categoria: ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                          TextSpan(
                              text: produtos[index]['categoria'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.purple)),
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
                              text: 'R\$' + produtos[index]['preco'].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.purple)),
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
                              text: produtos[index]['estoque'].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.purple)),
                        ]),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: (() {
                        atualNome = produtos[index]['nome'];
                        atualPreco = produtos[index]['preco'].toString();
                        atualEstoque = produtos[index]['estoque'].toString();
                        i = index;

                        Navigator.of(context).pushNamed('/edit');
                      }),
                      icon: Icon(
                        Icons.edit,
                        color: corPrincipal(),
                      )),
                ),
              ],
            ),
          );
        }),
    );
  }
}
