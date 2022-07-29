import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'gerenciadorpage.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => EditPageState();
}

class EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    String novoNome = atualNome;
    String novoPreco = atualPreco;
    String novoEstoque = atualEstoque;
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
                  child: TextFormField( 
                    initialValue: atualNome,                                       
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
                  child: TextFormField(
                    initialValue: atualPreco,
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
                  child: TextFormField(
                      initialValue: atualEstoque,
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
                      produtos[i] = {
                        'nome': novoNome,
                        'preco': int.parse(novoPreco),
                        'estoque': int.parse(novoEstoque),
                      };
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/gerenciador', (Route<dynamic> route) => false);
                    }),
                    child: Text(
                      'Atualizar Produto',
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
