import 'package:calculadora/componentes/Button.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final List<Button> buttons;

  ButtonRow(this.buttons);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[], (list,button){
          list.isEmpty ? list.add(button) : list.addAll([SizedBox(width: 1), button]);
          return list;
        }) ,
      ),
    );
  }
}
