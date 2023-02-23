import 'dart:html';

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
//       return Column(
//         children: const <Widget> [
//           Padding(padding: EdgeInsets.all(20),) ,
//           Text('Conversaciones', textAlign: TextAlign.center,
//            style: TextStyle(fontWeight:FontWeight.w500, fontFamily:'roboto',fontSize: 20, fontStyle: FontStyle.normal, color: Color.fromRGBO(0, 90, 194, 1))),
           
//           ],
//         );
//       }
      
// }


    return  Stack(
      
    children: [
      Column(
        
        mainAxisSize: MainAxisSize.min ,
        children: const [ 
          Padding(padding: EdgeInsets.only(top:20),),
          CircleAvatar(),
          Text('chat user name')
        ],
        
      ),
    ],
    
    
     
    );

  }
}

