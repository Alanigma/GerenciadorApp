import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/lista_produtos_page.dart';
import 'package:flutter_application_1/Pages/caixa_page.dart';
import 'package:flutter_application_1/Assets/cores.dart';

//Produtos
List<Map> produtos = [];
//Index do Produto Editado
late int i;

class GerenciadorPage extends StatefulWidget {
  const GerenciadorPage({Key? key}) : super(key: key);

  @override
  State<GerenciadorPage> createState() => _GerenciadorPageState();
}

class _GerenciadorPageState extends State<GerenciadorPage> {
  //Para testar com muitos produtos
  /*void initState() {
    // TODO: implement initState
    super.initState();
    for (int c = 0; c < 20; c++) {
      produtos.add({'nome': 'auto', 'preco': 21, 'estoque': 20});
    }
    ;
  }*/

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //Desligando controller quando sai da página
    pageViewController.dispose();
  }

  //Definindo o controller da pageView
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BottomNavigationBar
      body: PageView(
        controller: pageViewController,
        //Páginas da home_page
        children: [ListaProdutosPage(), CaixaPage()],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: pageViewController.page?.round() ?? 0,
              onTap: (index) {
                pageViewController.jumpToPage(index);
              },
              //Icones e nomes que aparecem na BottomNavigationBar
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
