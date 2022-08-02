import 'package:flutter/material.dart';
import 'package:flutter_application_1/Assets/cores.dart';

//Aviso de erro por campo obrigatório vazio
SnackBarCamposInvalidos(context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: corAlternativa(),
      content: Text('Algum campo tem caracteres não permitidos ou está vazio')));
}
