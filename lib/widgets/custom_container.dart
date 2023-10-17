import 'package:flutter/material.dart';

Widget buildCustomContainer() {
  return Container(
    color: Colors.red,
    height: 100,
    width: 100,
    child: const Text(
      'My name is noman',
      style: TextStyle(color: Colors.white),
    ),
  );
}

Widget buildCustomParametrizedNonNulAble(color, text) {
  return Container(
    color: color,
    height: 100,
    width: 100,
    child: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
  );
}

Widget buildCustomParametrizedNullAble({color,String? text}) {
  return Container(
    color: color ?? Colors.black,
    height: 100,
    width: 100,
    child: Text(
      text ?? 'Demo',
      style: const TextStyle(color: Colors.white),
    ),
  );
}
