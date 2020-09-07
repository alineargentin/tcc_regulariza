import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:tcc_regulariza/views/login.dart';

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
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushNamed(context, Login.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildLogo(),
        ],
      ),
    );
  }

  Widget buildLogo() {
    return Center(child: Image.asset("assets/feather_pen.jpg"));
  }
}
