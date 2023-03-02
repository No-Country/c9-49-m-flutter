import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  const PasswordInput(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.label})
      : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _passwordHidden = true;
  bool _isPasswordValid = true;

  RegExp passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  void _validatePassword(String value) {
    setState(() {
      if (value == '') {
        _isPasswordValid = true;
      } else {
        _isPasswordValid = passwordRegExp.hasMatch(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      obscureText: _passwordHidden,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 16.0),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
        suffixIcon: IconButton(
          icon:
              (Icon(_passwordHidden ? Icons.visibility : Icons.visibility_off)),
          onPressed: () {
            setState(() {
              _passwordHidden = !_passwordHidden;
            });
          },
        ),
        suffixIconColor: const Color.fromARGB(255, 0, 0, 0),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1, color: Color.fromARGB(98, 0, 238, 1)),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: Color.fromARGB(98, 0, 238, 1)),
        ),
        errorText: _isPasswordValid
            ? null
            : 'Debe contener 8 caracteres, números y letras',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Este campo no puede estar vacío";
        }
        if (passwordRegExp.hasMatch(value)) {
          return 'Debe contener 8 caracteres, números y letras';
        }
        return null;
      },
      onChanged: _validatePassword,
    );
  }
}
