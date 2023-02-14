import "package:flutter/material.dart";

class FormInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const FormInput({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.87),
        ),
        // hintText: 'Chat Lingo',
        // hintStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1, color: Color.fromARGB(98, 0, 238, 1)
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2, color: Color.fromARGB(98, 0, 238, 1)
          ),
        )),
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Este campo no puede estar vacío";
        }
        return null;
      },
    );
  }
}