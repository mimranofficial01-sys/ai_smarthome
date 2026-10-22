import 'package:flutter/material.dart';

Widget inputField(
  String label,
  IconData icon, {
  bool obscure = false,
  TextInputType? type,
  TextEditingController? controller,
}) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
        ),
      ),
    );
