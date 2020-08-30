import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:tcc_regulariza/service/auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = '/forgot_password';
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _showEmailTextField(),
              _showSendButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showEmailTextField() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(hintText: 'Email', prefixIcon: Icon(Icons.email)),
    );
  }

  Future<void> _send() async {
    final email = _emailController.text;
    await Auth.forgotPasswordEmail(email)
        .then((_) => _onForgotPasswordSuccess())
        .catchError((error) {
      print('Caught error: $error');
      Flushbar(
        title: 'Erro',
        message: 'E-mail não encontrado. Verifique o e-mail digitado e tente novamente ou retorne à página anterior e cadastre-se',
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }

  Widget _showSendButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: RaisedButton(child: Text('Enviar'), onPressed: _send),
    );
  }

  Future _onForgotPasswordSuccess() async {
    Flushbar(
      title: 'Sucesso',
      message:
          'Verifique seu e-mail para redefinir sua senha, depois tente novamente.',
      duration: Duration(seconds: 3),
    )
      ..show(context).then((value) {
        // usa pop para voltar para a página anterior
        Navigator.pop(context);
      });
  }
}
