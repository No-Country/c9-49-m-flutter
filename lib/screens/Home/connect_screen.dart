import 'package:flutter/material.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.pink,
        child: const Center(
          child: Text('Conectando', style: TextStyle(fontSize: 25),),
        ),
      );
  }
}