import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc_regulariza/service/auth.dart';
import 'package:tcc_regulariza/views/forgot_password.dart';
import 'package:tcc_regulariza/views/home_page.dart';
import 'cadastro.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  bool _obscurePassword = true;

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
              _showPasswordTextField(),
              _showForgotPasswordButton(),
              _showSignInButton(),
              _showSignUpButton(),
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

  void _toggleObscurePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Widget _showPasswordTextField() {
    return TextField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        hintText: 'Senha',
        prefixIcon: Icon(Icons.vpn_key),
        suffixIcon: IconButton(
          icon:
              Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
          onPressed: _toggleObscurePassword,
        ),
      ),
    );
  }

  Widget _showForgotPasswordButton() {
    return  RaisedButton(child: Text('Esqueci minha senha'), onPressed: _forgotPassword);
  }

  void _forgotPassword() {
    // usa Navigator.pushNamed para poder voltar à tela de login ao clicar no botão físico do celular
    Navigator.pushNamed(context, ForgotPassword.routeName);
  }

  Future<void> _signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    await Auth.signIn(email, password)
        .then((_onSignInSuccess))
        .catchError((error) {
      // tratativa de erro de login
      print('Caught error: $error');
      Flushbar(
        title: 'Erro',
        message: 'Login ou senha inválidos',
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }

  Future _onSignInSuccess(String userId) async {
    final user = await Auth.getUser(userId);
    await Auth.storeUserLocal(user);

    // usa pushReplacementNamed para poder voltar à tela de login ao clicar no botão físico do celular
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  Widget _showSignInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: RaisedButton(child: Text('Login'), onPressed: _signIn),
    );
  }

  void _signUp() {
    // usa Navigator.pushNamed para poder voltar à tela de login ao clicar no botão físico do celular
    Navigator.pushNamed(context, Cadastro.routeName);
  }

  Widget _showSignUpButton() {
    return RaisedButton(child: Text('Cadastre-se'), onPressed: _signUp);
  }
}
