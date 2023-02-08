import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.blueGrey,
        child: Center(
          child: Text('Chateando', style: TextStyle(fontSize: 25),),
          ),
      );
  }
}