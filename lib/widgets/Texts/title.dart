import "package:flutter/material.dart";

class AppTitle extends StatelessWidget {
  final String text;

  const AppTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.black));
  }
}
