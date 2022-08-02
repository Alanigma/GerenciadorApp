import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Assets/snacks_bars.dart';
import 'package:flutter_application_1/Pages/gerenciador_page.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    //Variáveis dos TextFields
    String novoNome = '';
    String novoCategoria = '';
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
              //Nome do Produto
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
              //Categoria
              Expanded(
                  flex: 1,
                  child: Text(
                    'Categoria',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Expanded(
                  flex: 2,
                  child: TextField(
                      onChanged: (value) {
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
              //Preço
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
              //Estoque
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
          //Submit
          Row(
            children: [
              //Espaço para o Botão Pegar só Metade da Tela
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                child: ElevatedButton(
                    onPressed: (() {
                      //Checagem se algum textfield está vazio
                      if (novoNome == '' ||
                          novoCategoria == '' ||
                          novoPreco == '' ||
                          novoEstoque == '') {
                        //Mensagem de erro
                        snackBarAddVazio(context);
                      } else {
                        try {
                          //Adcionar produtos ao sistema
                          produtos.add({
                            'nome': novoNome,
                            'categoria': novoCategoria,
                            'preco': int.parse(novoPreco),
                            'estoque': int.parse(novoEstoque),
                          });
                          //Navegar para a home
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/', (Route<dynamic> route) => false);
                        } catch (erro) {
                          print(erro);
                        }
                      }
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
