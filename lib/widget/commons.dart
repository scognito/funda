import 'package:flutter/material.dart';

Widget y4() {
  return const SizedBox(height: 4);
}

Widget y8() {
  return const SizedBox(height: 8);
}

Widget y24() {
  return const SizedBox(height: 24);
}

Widget x4() {
  return const SizedBox(width: 4);
}

Widget x8() {
  return const SizedBox(width: 8);
}

Widget x24() {
  return const SizedBox(width: 24);
}

Widget separator({padding = true}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: padding == true ? 8.0 : 0, vertical: 8.0),
    child: Container(height: 1, color: Colors.grey),
  );
}
