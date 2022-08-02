import 'package:flutter/material.dart';
import 'package:flutter_application_1/Assets/cores.dart';

//Aviso de erro por campo obrigatório vazio
snackBarAddVazio(context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: corAlternativa(),
      content: Text('Você deve Preencher Todos os Campos')));
}
