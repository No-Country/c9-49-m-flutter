import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final color = Colors.red;
  String title = 'Mi perfil';

  @override
  Widget build(BuildContext context) {
      return Container(
        color: color,
        child: Center(
          child: Text(title, style: TextStyle(fontSize: 25),),
          ),
      );
  }
}