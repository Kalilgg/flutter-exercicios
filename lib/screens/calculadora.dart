import 'package:calculadora/componentes/Keyboard.dart';
import 'package:calculadora/models/memory.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/componentes/Display.dart';
import 'package:flutter/services.dart';


class Calculadora extends StatefulWidget{
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {

  static const operations = const ['%','X','-','=','+', '/'];
  final Memory memory = Memory();

  _onPressed(String commmand){
    setState(() {
      memory.applyCommand(commmand);
    });;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: Column(
        children: <Widget> [
            Display(memory.value),
            Keyboard(_onPressed),
        ],
      ),



    );

  }
}