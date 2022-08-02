import 'package:flutter/material.dart';
import '../Assets/cores.dart';
import 'gerenciador_page.dart';

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
        tooltip: 'Adicionar Novo Produto',
        backgroundColor: corPrincipal(),
        hoverColor: Colors.purpleAccent,
        splashColor: corSecundaria(),
        foregroundColor: corSecundaria(),
        onPressed: () {
          Navigator.of(context).pushNamed('/add');
        },
        child: Icon(Icons.add),
      ),
      //Builder dos cards com informações de cada produto
      body: ListView.builder(
          itemCount: produtos.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 20,
              //arredondamento dos cards
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
                      //botao de remover produto
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
                                text: produtos[index]['nome'],
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
                                text: produtos[index]['categoria'],
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
                                text:
                                    'R\$' + produtos[index]['preco'].toString(),
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
                    //botao de edição
                    child: IconButton(
                        onPressed: (() {
                          //pega o index do produto que vai ser editado
                          i = index;
                          //Navega para a página de edição
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
