import 'package:flutter/material.dart';
import 'package:tcc_regulariza/views/agendamento.dart';
import 'package:tcc_regulariza/views/cadastro.dart';
import 'package:tcc_regulariza/views/forgot_password.dart';
import 'package:tcc_regulariza/views/home_page.dart';
import 'package:tcc_regulariza/views/login.dart';
import 'package:tcc_regulariza/views/perfil.dart';
import 'package:tcc_regulariza/views/sobre.dart';
import 'package:tcc_regulariza/views/splash.dart';
import 'package:tcc_regulariza/views/vencimentos_documentos.dart';

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
        Vencimento.routeName: (context) => new Vencimento(),
        Agendamento.routeName: (context) => new Agendamento(),
        Sobre.routeName: (context) => new Sobre()
      },
    );
  }
}
