import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_regulariza/service/auth.dart';
import 'package:tcc_regulariza/views/login.dart';

class Common {
  static Future setPortraitOrientation() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  static Future<bool> showQuitDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sair"),
          content: Text("Você realmente deseja sair do aplicativo?"),
          actions: <Widget>[
            FlatButton(
              child: Text("Sim"),
              onPressed: () async {
                Auth.signOut();
                Navigator.pushReplacementNamed(context, Login.routeName);
              },
            ),
            FlatButton(
              child: Text("Não"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );

    return Future.value(false);
  }

  static Widget progressContainer() {
    return Center(child: CircularProgressIndicator());
  }

  static Widget errorContainer({String error}) {
    return Center(child: Text(error));
  }

  static Widget emptyContainer({String message}) {
    return Center(child: Text(message));
  }
}
