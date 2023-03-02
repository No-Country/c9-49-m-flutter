import "package:flutter/material.dart";

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        fixedSize: const Size(120, 40),
        backgroundColor: const Color.fromRGBO(0, 90, 194, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(text,
          style: const TextStyle(
            color: Color.fromRGBO(230, 230, 230, 1),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
