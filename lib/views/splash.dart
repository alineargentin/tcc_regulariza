import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:tcc_regulariza/views/login.dart';
import 'package:tcc_regulariza/service/auth.dart';

import 'home_page.dart';

// tela de Inicio
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 2)).then((_) async {
      var userLocal = await Auth.getUserLocal();
      if (userLocal == null) {
        Navigator.pushReplacementNamed(context, Login.routeName);
      } else {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildTitle(),
          buildLogo(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Center(
      child: Text(
        'Cartório Fácil',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }

  Widget buildLogo() {
    return Hero(
      tag: 'appLogo',
      child: Center(
        child: Image.asset("assets/logo_cartorio_facil.png"),
      ),
    );
  }
}
