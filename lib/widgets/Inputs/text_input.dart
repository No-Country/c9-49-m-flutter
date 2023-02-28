import "package:flutter/material.dart";

class TextInput extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const TextInput(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          labelStyle: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 16.0),
          hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: Color.fromARGB(98, 0, 238, 1)),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 3, color: Color.fromARGB(255, 0, 0, 0)),
          )),
      validator: (value) {
        if (value!.isEmpty) {
          return "Este campo no puede estar vacío";
        }
        return null;
      },
    );
  }
}
