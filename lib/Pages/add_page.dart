import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Assets/snacks_bars.dart';
import 'package:flutter_application_1/Pages/gerenciador_page.dart';

//Checar se o campo é válido
bool checkNome = false;
bool checkCategoria = false;
bool checkPreco = false;
bool checkEstoque = false;

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  //Variáveis dos TextFields
  String novoNome = '';
  String novoCategoria = '';
  double novoPreco = 0;
  int novoEstoque = 0;  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkNome = false;
    checkCategoria = false;
    checkPreco = false;
    checkEstoque = false;
  }

  @override
  Widget build(BuildContext context) {
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
                        try {
                          //atualiza variavel com textField
                          novoNome = value;
                          //checa se o campo está vasio e avisa se o campo está válido
                          value != '' ? checkNome = true : checkNome = false;
                        } catch (erro) {
                          print(erro);
                          //Avisa que o campo não está válido
                          checkNome = false;
                        }
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
                        try {
                          //atualiza varivel com o textField
                          novoCategoria = value;
                          //checa se o campo está vasio e avisa se o campo está válido
                          value != '' ? checkCategoria = true : checkCategoria = false;
                        } catch (erro) {
                          print(erro);
                          //Avisa que o campo não está válido
                          checkCategoria = false;
                        }
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
                        value = value.replaceAll(',', '.');
                        try {
                          //atualiza variavel com textField
                          novoPreco = double.parse(value);
                          //checa se o campo está vasio e avisa se o campo está válido
                          value != '' ? checkPreco = true : checkPreco = false;
                        } catch (erro) {
                          print(erro);
                          //Avisa que o campo não está válido
                          checkPreco = false;
                        }
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
                        try {
                          //atualiza variavel com textField
                          novoEstoque = int.parse(value);
                          //checa se o campo está vasio e avisa se o campo está válido
                          value != '' ? checkEstoque = true : checkEstoque = false;
                        } catch (erro) {
                          print(erro);
                          //Avisa que o campo não está válido
                          checkEstoque = false;
                        }
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
                      if (!checkNome ||
                          !checkCategoria ||
                          !checkPreco ||
                          !checkEstoque) {
                        //Mensagem de erro
                        SnackBarCamposInvalidos(context);
                      } else {
                        try {
                          //Adcionar produtos ao sistema
                          produtos.add({
                            'nome': novoNome,
                            'categoria': novoCategoria,
                            'preco': novoPreco,
                            'estoque': novoEstoque,
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
