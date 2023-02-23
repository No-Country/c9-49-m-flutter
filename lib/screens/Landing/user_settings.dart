import "package:flutter/material.dart";

class UserPreferencesScreen extends StatelessWidget {
  const UserPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)?.settings.arguments;

    return Container(
      child: Text("hola"),
    );
  }
}
