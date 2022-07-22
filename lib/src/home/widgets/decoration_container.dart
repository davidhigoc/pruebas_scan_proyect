import 'package:flutter/material.dart';

BoxDecoration decotationBox() {
  return const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(8)),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(2, 2),
        blurRadius: 2,
      ),
      BoxShadow(
        color: Colors.black12,
        offset: Offset(-2, -2),
        blurRadius: 2,
      ),
    ],
  );
}
