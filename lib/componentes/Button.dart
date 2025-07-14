import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  static const Color DARK = Colors.black45;
  static const Color DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const Color OPERATION = Color.fromRGBO(250, 158, 13, 1);

  final void Function(String) cb;

  final Color color;
  final String texto;
  final bool big;

  Button({
    required this.texto,
    this.big = false,
    this.color = DEFAULT,
    required this.cb,
  });
  Button.big({
    required this.texto,
    this.big = true,
    this.color = DEFAULT,
    required this.cb,
  });
  Button.operation({
    required this.texto,
    this.big = false,
    this.color = OPERATION,
    required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(this.color),
          shape: WidgetStateProperty.all<OutlinedBorder>
          (RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        ),
        onPressed: () => cb(texto),
        child: Text(
            texto,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
