import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:tcc_regulariza/models/user.dart';
import 'package:tcc_regulariza/service/auth.dart';
import 'package:tcc_regulariza/views/home_page.dart';

class Cadastro extends StatefulWidget {
  static const String routeName = '/cadastro';

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _nomeController = new TextEditingController();
  //final _rgController = new TextEditingController();
  //final _cpfController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _senhaController = new TextEditingController();
  final _confirmarsenhaController = new TextEditingController();
  final _telefoneController = new MaskedTextController(mask: '(00)00000-0000');

  final _nomeFocusNode = new FocusNode();
  //final _rgFocusNode = new FocusNode();
  //final _cpfFocusNode = new FocusNode();
  final _emailFocusNode = new FocusNode();
  final _senhaFocusNode = new FocusNode();
  final _confirmarsenhaFocusNode = new FocusNode();
  final _telefoneFocusNode = new FocusNode();

  final _formKey = new GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmation = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _showNomeTextField(),
                //_showRgTextField(),
                //_showCpfTextField(),
                _showEmailTextField(),
                _showSenhaTextField(),
                _showConfirmarsenhaTextField(),
                _showTelefoneTextField(),
                _showSignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Componentes para a criação da tela de cadastro
  Widget _showNomeTextField() {
    return TextFormField(
      controller: _nomeController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Digite seu nome',
        prefixIcon: Icon(Icons.person),
      ),
      textInputAction: TextInputAction.next,
      autofocus: true,
      focusNode: _nomeFocusNode,
      validator: (String value) {
        return value.isEmpty ? 'O nome é obrigatório' : null;
      },
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_emailFocusNode),
    );
  }

// Tratamento de numeros e letras e quantidade especifica.
  /*Widget _showRgTextField(){
      return TextField(
       controller: _rgController,
      keyboardType: TextInputType.text,
      maxLength:9,
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
 // Tratamento de apenas numeros e quantidade de nº determinado.
  Widget _showCpfTextField(){
      return TextField(
       controller: _cpfController,
      keyboardType: TextInputType.number,
      maxLength: 11,
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
*/
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
      validator: (String value) {
        return value.isEmpty ? 'O e-mail é obrigatório' : null;
      },
      onEditingComplete: () =>
          // ao terminar de editar, move o foco para o próximo campo
          FocusScope.of(context).requestFocus(_senhaFocusNode),
    );
  }

  Widget _showSenhaTextField() {
    return TextFormField(
      controller: _senhaController,
      keyboardType: TextInputType.text,
      obscureText: _obscurePassword,
      validator: (String value) {
        return value.length < 6
            ? 'A senha deve conter no mínimo 6 caracteres'
            : null;
      },
      maxLength: 12,
      decoration: InputDecoration(
        hintText: 'Digite uma senha',
        prefixIcon: Icon(Icons.vpn_key),
        suffixIcon: IconButton(
          icon:
              Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
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
        obscureText: _obscureConfirmation,
        decoration: InputDecoration(
          hintText: 'Confirmar sua senha',
          prefixIcon: Icon(Icons.vpn_key),
          suffixIcon: IconButton(
            icon: Icon(
                _obscureConfirmation ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _obscureConfirmation = !_obscureConfirmation;
              });
            },
          ),
        ),
        textInputAction: TextInputAction.next,
        focusNode: _confirmarsenhaFocusNode,
        validator: (String value) {
          return _senhaController.text != value
              ? 'A confirmação deve ser igual à senha'
              : null;
        },
        onEditingComplete: () =>
            FocusScope.of(context).requestFocus(_telefoneFocusNode));
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
      focusNode: _telefoneFocusNode,
    );
  }

  Future _signUp() async {
    if (_formKey.currentState.validate()) {
      final email = _emailController.text;
      final password = _senhaController.text;
      await Auth.signUp(email, password)
          .then(_onResultSignUpSuccess)
          .catchError((error) {
        Flushbar(
          title: 'Erro',
          message: error.message,
          duration: Duration(seconds: 3),
        )..show(context);
      });
    }
  }

  void _onResultSignUpSuccess(String userId) {
    final email = _emailController.text;
    final name = _nomeController.text;
    final phone = _telefoneController.text;
    //final cpf = _cpfController.text;
    //final rg = _rgController.text;
    final user = User(userId: userId, name: name, email: email, phone: phone);
    Auth.storeUserLocal(user);
    Auth.addUser(user).then(_onResultAddUser);
  }

  void _onResultAddUser(result) {
    Flushbar(
      title: 'Novo usuário',
      message: 'Usuário registrado com sucesso!',
      duration: Duration(seconds: 2),
    )..show(context);
    Navigator.of(context).pushReplacementNamed(HomePage.routeName);
  }

// criação do botão
  Widget _showSignUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: RaisedButton(
        child: Text('Cadastrar'),
        color: Colors.amberAccent,
        onPressed: _signUp,
      ),
    );
  }
}
