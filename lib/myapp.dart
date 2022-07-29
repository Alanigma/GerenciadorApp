import 'package:flutter/material.dart';
import 'package:flutter_application_1/addpage.dart';
import 'package:flutter_application_1/editpage.dart';
import 'package:flutter_application_1/gerenciadorpage.dart';
import 'package:flutter_application_1/vendapage.dart';
import 'homepage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
      initialRoute: '/',
      routes: {
        '/':(context) => HomePage(),
        '/gerenciador':(context) => GerenciadorPage(),
        '/add':(context) => AddPage(),
        '/edit':(context) => EditPage(),
        '/venda':(context) => VendaPage(),
      },
    );    
  }
}