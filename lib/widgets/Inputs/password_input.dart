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
            icon: (Icon(
                _passwordHidden ? Icons.visibility : Icons.visibility_off)),
            onPressed: () {
              setState(() {
                _passwordHidden = !_passwordHidden;
              });
            },
          ),
          suffixIconColor: const Color.fromARGB(255, 0, 0, 0),
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
          return "Please enter some text";
        }
        return null;
      },
    );
  }
}

// class PasswordInput extends StatelessWidget {
//   final String label;
//   final String hintText;
//   final TextEditingController controller;

//   const PasswordInput(
//       {super.key,
//       required this.label,
//       required this.hintText,
//       required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     bool passwordHidden = true;

//     return TextFormField(
//       controller: controller,
//       keyboardType: TextInputType.emailAddress,
//       obscureText: passwordHidden,
//       decoration: InputDecoration(
//           suffixIcon: IconButton(
//             icon: (Icon(
//                 passwordHidden ? Icons.visibility : Icons.visibility_off)),
//             onPressed: () {
//               passwordHidden = !passwordHidden;
//             },
//           ),
//           suffixIconColor: const Color.fromARGB(255, 0, 0, 0),
//           labelText: label,
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
//           labelStyle: const TextStyle(
//               color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 16.0),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//                 width: 1, color: Color.fromARGB(98, 0, 238, 1)),
//             borderRadius: BorderRadius.circular(4),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide:
//                 BorderSide(width: 2, color: Color.fromARGB(98, 0, 238, 1)),
//           )),
//       validator: (value) {
//         if (value!.isEmpty) {
//           return "Please enter some text";
//         }
//         return null;
//       },
//     );
//   }
// }
