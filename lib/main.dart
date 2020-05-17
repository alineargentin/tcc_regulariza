import 'package:flutter/material.dart';
import 'package:tcc_regulariza/views/cadastro.dart';
import 'package:tcc_regulariza/views/home_page.dart';
import 'package:tcc_regulariza/views/login.dart';
import 'package:tcc_regulariza/views/perfil.dart';

void main() {
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
      home: Login(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
       Cadastro.routeName:(context) => new Cadastro(),
       Perfil.routeName:(context) => new Perfil(),
       HomePage.routeName:(context) => new HomePage(),

      },
      
    );

  }
  
}