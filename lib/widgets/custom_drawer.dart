import 'package:flutter/material.dart';
import 'package:tcc_regulariza/models/user.dart';
import 'package:tcc_regulariza/service/auth.dart';
import 'package:tcc_regulariza/utils/common.dart';
import 'package:tcc_regulariza/views/home_page.dart';
import 'package:tcc_regulariza/views/login.dart';
import 'package:tcc_regulariza/views/perfil.dart';
import 'package:tcc_regulariza/views/sobre.dart';
import 'package:tcc_regulariza/views/termo.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  User _user = new User();

  @override
  void initState() {
    Auth.getUserLocal().then(_onGetUserLocalSuccess);
    super.initState();
  }

  void _onGetUserLocalSuccess(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _showHeader(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(Perfil.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Chatbot'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(HomePage.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Sobre o aplicativo'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(Sobre.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Termos de uso'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(Termo.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () async {
              final result = await Common.showQuitDialog(context);
              if (result) {
                Auth.signOut();
                Navigator.pushReplacementNamed(context, Login.routeName);
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _showHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(_user?.name ?? ""),
      accountEmail: Text(_user?.email ?? ""),
      currentAccountPicture:
          CircleAvatar(child: Text(_user?.getInitials() ?? '')),
    );
  }
}
