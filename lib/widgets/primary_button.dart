import "package:flutter/material.dart";

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed,
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromRGBO(0, 90, 194, 1),
        padding: const EdgeInsets.all(14.0)
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color.fromRGBO(230, 230, 230, 1),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        )),
    );
  }
}