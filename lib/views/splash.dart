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
