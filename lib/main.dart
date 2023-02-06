import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';


void main() => runApp( MyApp());


class MyApp extends StatelessWidget {
  
   @override
   Widget build (BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false, // eliminar banda 'debug' borde sup
      title: 'Material app',
      
      home: homeScreen()
    );
   }
}





