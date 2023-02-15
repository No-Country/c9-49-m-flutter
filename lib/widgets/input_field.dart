import "package:flutter/material.dart";

class InputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validation;

  const InputField({super.key, required this.label, required this.hintText, required this.controller, required this.validation});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.87),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
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
      validator: validation,
    );
  }
}