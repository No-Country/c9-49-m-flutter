import "package:flutter/material.dart";

class EmailInput extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const EmailInput(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 16.0),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: Color.fromARGB(98, 0, 238, 1)),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: Color.fromARGB(98, 0, 238, 1)),
          )),
      validator: (value) {
        if (value!.isEmpty) {
          return "Este campo no puede estar vacío";
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return "Ingrese un email valido por favor";
        }
        return null;
      },
    );
  }
}
