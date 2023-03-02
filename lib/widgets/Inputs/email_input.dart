import "package:flutter/material.dart";

class EmailInput extends StatefulWidget {
  const EmailInput(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller});

  final String label;
  final String hintText;
  final TextEditingController controller;

  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool _isEmailValid = true;

  void _validateEmail(String value) {
    setState(() {
      if (value == '') {
        _isEmailValid = true;
      } else {
        _isEmailValid = emailRegExp.hasMatch(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 16.0),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: Color.fromARGB(98, 0, 238, 1)),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: Color.fromARGB(98, 0, 238, 1)),
          ),
          errorText:
              _isEmailValid ? null : 'Ingrese un email valido por favor'),
      validator: (value) {
        if (value!.isEmpty) {
          return "Este campo no puede estar vacío";
        }
        if (emailRegExp.hasMatch(value)) {
          return "Ingrese un email valido por favor";
        }
        return null;
      },
      onChanged: _validateEmail,
    );
  }
}
