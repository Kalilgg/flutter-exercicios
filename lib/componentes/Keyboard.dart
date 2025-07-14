import 'package:calculadora/componentes/Button.dart';
import 'package:calculadora/componentes/ButtonRow.dart';
import 'package:flutter/material.dart';


class Keyboard extends StatelessWidget{

  final void Function(String) cb;
  Keyboard(this.cb);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: <Widget> [
          ButtonRow([
            Button(texto: 'AC', cb:cb),
            Button(texto: 'CL', cb:cb),
            Button.operation(texto: '%', cb:cb),
            Button.operation(texto: '/', cb:cb),
          ]),
          SizedBox(height: 1,),
          ButtonRow([
            Button(texto: '9', cb:cb),
            Button(texto: '8', cb:cb),
            Button(texto: '7', cb:cb),
            Button.operation(texto: 'X', cb:cb),
          ]),
          SizedBox(height: 1,),
          ButtonRow([
            Button(texto: '6', cb:cb),
            Button(texto: '5', cb:cb),
            Button(texto: '4', cb:cb),
            Button.operation(texto: '-', cb:cb),
          ]),
          SizedBox(height: 1,),
          ButtonRow([
            Button(texto: '3', cb:cb),
            Button(texto: '2', cb:cb),
            Button(texto: '1', cb:cb),
            Button.operation(texto: '+', cb:cb),
          ]),
          SizedBox(height: 1,),
          ButtonRow([
            Button.big(texto: '0', cb:cb),
            Button(texto: '.', cb:cb),
            Button.operation(texto: '=', cb:cb),
          ]),
        ],
      ),
    );
  }
}