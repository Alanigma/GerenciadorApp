import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/cores.dart';

List<Map> produtos = [];
late String atualNome;
late String atualPreco;
late String atualEstoque;
late int i;

class GerenciadorPage extends StatefulWidget {
  const GerenciadorPage({Key? key}) : super(key: key);

  @override
  State<GerenciadorPage> createState() => _GerenciadorPageState();
}

class _GerenciadorPageState extends State<GerenciadorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (() {
          Navigator.of(context).pushNamed('/venda');
        }), icon: Icon(Icons.sell, color: corSecundaria()))],
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
                                text: 'Preço: ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                            TextSpan(
                                text:
                                    'R\$' + produtos[index]['preco'].toString(),
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
