import 'package:flutter/material.dart';
import 'package:tcc_regulariza/widgets/custom_drawer.dart';

class Sobre extends StatefulWidget {
  static const String routeName = '/sobre';
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
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
      title: Text('Sobre o aplicativo'),
    );
  }

  Widget _buildBody() {
    return Center(child: Text('O aplicativo Cartório Fácil tem o intuito de tirar suas dúvidas dos diferentes tipos de documentação existentes dos serviços de cartórios.'));
  }
}