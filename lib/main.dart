import 'package:flutter/material.dart';
//import 'package:tcc_regulariza/views/cadastro.dart';
import 'package:tcc_regulariza/views/home_page.dart';
//import 'package:tcc_regulariza/views/login.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.deepOrange
    ),
    home: HomePage(),
  ));
}


/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Regulazira',
      theme: new ThemeData(
        primarySwatch: Colors.green
        ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
       Cadastro.routeName:(context) => new Cadastro(),
      },
      
    );

  }
  
}*/