import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'gerenciador_page.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => EditPageState();
}

class EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    //Variáveis dos textfields
    String novoNome = produtos[i]['nome'];
    String novoCategoria = produtos[i]['categoria'];
    String novoPreco = produtos[i]['preco'].toString();
    String novoEstoque = produtos[i]['estoque'].toString();
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
                      //Adiciona o valor atual no textfield
                      initialValue: produtos[i]['nome'],
                      onChanged: (value) {
                        //atualiza as variaveis dos textfields
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
                  child: Text(
                    'Categoria',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Expanded(
                  flex: 2,
                  child: TextFormField(
                    //Adiciona o valor atual no textfield
                    initialValue: produtos[i]['categoria'],
                    onChanged: (value) {
                      //atualiza as variaveis dos textfields
                      novoCategoria = value;
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
                    //Adiciona o valor atual no textfield
                    initialValue: produtos[i]['preco'].toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      //atualiza as variaveis dos textfields
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
                    //Adiciona o valor atual no textfield
                    initialValue: produtos[i]['estoque'].toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      //atualiza as variaveis dos textfields
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
                //submit
                child: ElevatedButton(
                  onPressed: (() {
                    //atualiza os produtos
                    produtos[i] = {
                      'nome': novoNome,
                      'categoria': novoCategoria,
                      'preco': int.parse(novoPreco),
                      'estoque': int.parse(novoEstoque),
                    };
                    //Navega para o home
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/', (Route<dynamic> route) => false);
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
