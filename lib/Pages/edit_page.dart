import 'package:flutter/material.dart';
import '../Assets/snacks_bars.dart';
import 'add_page.dart';
import 'gerenciador_page.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => EditPageState();
}

class EditPageState extends State<EditPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Checar se o campo é válido
    checkNome = true;
    checkCategoria = true;
    checkPreco = true;
    checkEstoque = true;
  }

  @override
  Widget build(BuildContext context) {
    //Variáveis dos textfields
    String novoNome = produtos[i]['nome'];
    String novoCategoria = produtos[i]['categoria'];
    double novoPreco = produtos[i]['preco'];
    int novoEstoque = produtos[i]['estoque'];
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
                        try {
                          //atualiza variavel com textField
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
          Row(
            children: [
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                //submit
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
                          //atualiza os produtos
                          produtos[i] = {
                            'nome': novoNome,
                            'categoria': novoCategoria,
                            'preco': novoPreco,
                            'estoque': novoEstoque,
                          };
                          //Navega para o home
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/', (Route<dynamic> route) => false);
                        } catch (erro) {
                          print(erro);
                        }
                      }
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
