import 'package:flutter/material.dart';
import 'package:tcc_regulariza/views/cadastro.dart';
import 'package:tcc_regulariza/views/forgot_password.dart';
import 'package:tcc_regulariza/views/home_page.dart';
import 'package:tcc_regulariza/views/login.dart';
import 'package:tcc_regulariza/views/perfil.dart';
import 'package:tcc_regulariza/views/sobre.dart';
import 'package:tcc_regulariza/views/splash.dart';
import 'package:tcc_regulariza/views/termo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartório Fácil',
      theme: new ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        Login.routeName: (context) => new Login(),
        Cadastro.routeName: (context) => new Cadastro(),
        Perfil.routeName: (context) => new Perfil(),
        HomePage.routeName: (context) => new HomePage(),
        ForgotPassword.routeName: (context) => new ForgotPassword(),
        Termo.routeName: (context) => new Termo(),
        Sobre.routeName: (context) => new Sobre()
      },
    );
  }
}
