import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/add_page.dart';
import 'package:flutter_application_1/Pages/edit_page.dart';
import 'package:flutter_application_1/Pages/gerenciador_page.dart';
import 'package:flutter_application_1/Pages/transacoes_page.dart';
import 'package:flutter_application_1/Pages/venda_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Localizações para utilizar o DateTime
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      //Setando localização para o Brasil
      supportedLocales: [Locale('pt', 'BR')],
      //Rota Inicial
      initialRoute: '/',
      //Rotas
      routes: {
        '/': (context) => const GerenciadorPage(),
        '/add': (context) => const AddPage(),
        '/edit': (context) => const EditPage(),
        '/venda': (context) => const VendaPage(),
        '/transacoes': (context) => const TransacoesPage(),
      },
    );
  }
}

//Inicialização
void main() {
  runApp(MyApp());
}
