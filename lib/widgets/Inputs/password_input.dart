// import 'package:flutter/material.dart';

// class PasswordInput extends StatelessWidget {
//   final String label;
//   final String hintText;
//   final bool passwordHidden;
//   final TextEditingController controller;

//   const PasswordInput({super.key, required this.label, required this.hintText,required this.passwordHidden, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       obscureText: passwordHidden,
//       decoration: InputDecoration(
//           suffixIcon: IconButton(
//             icon: (Icon(passwordHidden
//                 ? Icons.visibility
//                 : Icons.visibility_off)),
//             onPressed: () {
//               setState(() {
//                 passwordHidden = !passwordHidden;
//               });
//             },
//           ),
//           suffixIconColor: Color.fromARGB(255, 0, 0, 0),
//           labelText: label,
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.black),
//           labelStyle: const TextStyle(
//             color: Color.fromARGB(255, 0, 0, 0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//                 width: 3, color: Color.fromARGB(255, 0, 0, 0)),
//             borderRadius: BorderRadius.circular(5),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//                 width: 3, color: Color.fromARGB(255, 0, 0, 0)),
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