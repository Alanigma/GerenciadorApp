import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/ListaProdutosPage.dart';
import 'package:flutter_application_1/caixapage.dart';
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
  /*void initState() {
    // TODO: implement initState
    super.initState();
    for (int c = 0; c < 20; c++) {
      produtos.add({'nome': 'auto', 'preco': 21, 'estoque': 20});
    }
    ;
  }*/
  //Para testar com muitos produtos

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageViewController.dispose();
  }

  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(            
      body: PageView(
        controller: pageViewController,
        children: [
          ListaProdutosPage(),
          CaixaPage()
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: pageViewController.page?.round() ?? 0,
              onTap: (index) {
                pageViewController.jumpToPage(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Produtos'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.attach_money), label: 'Caixa'),
              ],
              
              selectedItemColor: corPrincipal(),
            );
          }),
    );
  }
}
