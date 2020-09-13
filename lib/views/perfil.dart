import 'package:flutter/material.dart';
import 'package:tcc_regulariza/models/user.dart';
import 'package:tcc_regulariza/service/auth.dart';
import 'package:tcc_regulariza/widgets/custom_drawer.dart';

class Perfil extends StatefulWidget {
  static const String routeName = '/perfil';
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  User _currentUser;

  @override
  void initState() {
    super.initState();
    Auth.getUserLocal().then((user) {
      setState(() {
        _currentUser = user;
        print('Current user: ${_currentUser.toJson()}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: CustomDrawer(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Perfil'),
    );
  }

  Widget _buildBody() {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Text(_currentUser.name),
          new Text(_currentUser.email),
          new Text(_currentUser.phone)
        ],
      ),
    );
  }
}
