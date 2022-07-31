import 'package:flutter/material.dart';
import 'package:flutter_application_1/addpage.dart';
import 'package:flutter_application_1/caixapage.dart';
import 'package:flutter_application_1/editpage.dart';
import 'package:flutter_application_1/gerenciadorpage.dart';
import 'package:flutter_application_1/vendapage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'homepage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("pt", "BR")
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/gerenciador': (context) => GerenciadorPage(),
        '/add': (context) => AddPage(),
        '/edit': (context) => EditPage(),
        '/venda': (context) => VendaPage(),
      },      
    );
  }
}
