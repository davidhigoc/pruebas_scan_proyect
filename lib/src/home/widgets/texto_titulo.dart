import 'package:flutter/material.dart';

class TextTitulo extends StatelessWidget {
  const TextTitulo({
    Key? key,
    required this.tituloText,
  }) : super(key: key);

  final String tituloText;

  @override
  Widget build(BuildContext context) {
    return Text(
      tituloText,
      style: TextStyle(
        color: Colors.grey.shade800,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
