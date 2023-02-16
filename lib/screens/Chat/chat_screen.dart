import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.blueGrey,
        child: const Center(
          child: Text('Chateando', style: TextStyle(fontSize: 25),),
          ),
      );
  }
}