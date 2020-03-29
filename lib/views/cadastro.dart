
import 'package:flutter/material.dart';
//import 'package:flushbar/flushbar.dart';
//import 'package:projeto_teste/services/auth.dart';
//import 'package:projeto_teste/models/user.dart';
//import 'package:projeto_teste/views/login.dart';

class Cadastro extends StatefulWidget {
  static const String routeName = '/cadastro';

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _nomeController = new TextEditingController();
  final _rgController = new TextEditingController();
  final _cpfController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _senhaController = new TextEditingController();
  final _confirmarsenhaController = new TextEditingController();
  final _telefoneController = new TextEditingController();

  

  final _nomeFocusNode = new FocusNode();
  final _rgFocusNode = new FocusNode();
  final _cpfFocusNode = new FocusNode();
  final _emailFocusNode = new FocusNode();
  final _senhaFocusNode = new FocusNode();
  final _confirmarsenhaFocusNode = new FocusNode();
  final _telefoneFocusNode = new FocusNode();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _showNomeTextField(),
              _showRgTextField(),
              _showCpfTextField(),
              _showEmailTextField(),
              _showSenhaTextField(),
              _showConfirmarsenhaTextField(),
              _showTelefoneTextField(),
        
            ],
          ),
        ),
      ),
    );
 
  }

  Widget _showNomeTextField(){
      return TextField(
       controller: _nomeController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Digite seu nome',
        prefixIcon: Icon(Icons.person),
      ),
      textInputAction: TextInputAction.next,
      autofocus: true,
      focusNode: _nomeFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_emailFocusNode),
    );
  }

  Widget _showRgTextField(){
      return TextField(
       controller: _rgController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Digite seu RG',
        prefixIcon: Icon(Icons.description),
      ),
      textInputAction: TextInputAction.next,
      autofocus: true,
      focusNode: _rgFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_emailFocusNode),
    );

  }

  Widget _showCpfTextField(){
      return TextField(
       controller: _cpfController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Digite seu CPF',
        prefixIcon: Icon(Icons.description),
      ),
      textInputAction: TextInputAction.next,
      autofocus: true,
      focusNode: _cpfFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_emailFocusNode),
    );
}

 Widget _showEmailTextField() {
     return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Digite seu email',
        prefixIcon: Icon(Icons.email),
      ),
      textInputAction: TextInputAction.next,
      focusNode: _emailFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_senhaFocusNode),
    );
  }

    Widget _showSenhaTextField() {
    return TextFormField(
      controller: _senhaController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Digite uma senha',
        prefixIcon: Icon(Icons.vpn_key),
      ),
      textInputAction: TextInputAction.next,
      focusNode: _senhaFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_confirmarsenhaFocusNode),
    );
  }

  Widget _showConfirmarsenhaTextField() {
     return TextFormField(
      controller: _confirmarsenhaController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Confirmar sua senha',
        prefixIcon: Icon(Icons.vpn_key),
      ),
      textInputAction: TextInputAction.next,
      focusNode: _confirmarsenhaFocusNode,
       onEditingComplete: () =>
         FocusScope.of(context).requestFocus(_telefoneFocusNode)
    );
  }

  Widget _showTelefoneTextField() {
     return TextFormField(
      controller: _telefoneController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Telefone',
        prefixIcon: Icon(Icons.phone),
      ),
      textInputAction: TextInputAction.next,
      focusNode: _confirmarsenhaFocusNode,
    );
  }
}