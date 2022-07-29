import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/gerenciadorpage.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    String novoNome = '';
    String novoPreco = '';
    String novoEstoque = '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Adicionar Novo Produto'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    'Nome do Produto',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Expanded(
                  flex: 2,
                  child: TextField(
                    onChanged: (value) {
                      novoNome = value;
                    },
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.purpleAccent,
                        ))))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text('Preço',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  flex: 2,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      novoPreco = value;
                    },
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.purpleAccent,
                        ))))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text('Estoque',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  flex: 2,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      novoEstoque = value;
                    },
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.purpleAccent,
                        ))))),
            ],
          ),
          Row(
            children: [
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                child: ElevatedButton(
                    onPressed: (() {
                      produtos.add({
                        'nome': novoNome,
                        'preco': int.parse(novoPreco),
                        'estoque': int.parse(novoEstoque),
                      });
                      Navigator.of(context).pushNamedAndRemoveUntil('/gerenciador', (Route<dynamic> route) => false);
                    }),
                    child: Text(
                      'Adicionar Produto',
                      style: TextStyle(color: Colors.yellow),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
