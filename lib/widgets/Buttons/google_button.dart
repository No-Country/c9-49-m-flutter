import "package:flutter/material.dart";

class GoogleButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const GoogleButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
                width: 1, color: Theme.of(context).colorScheme.primary),
          ),
          padding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0)),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos/google.png',
              height: 25,
              width: 25,
            ),
            const SizedBox(width: 8),
            Text(text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ))
          ]),
    );
  }
}
