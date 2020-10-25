import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc_regulariza/widgets/custom_drawer.dart';

class Vencimento extends StatefulWidget {
  static const String routeName = '/vencimento';
  @override
  _VencimentoState createState() => _VencimentoState();
}

class _VencimentoState extends State<Vencimento> {
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
      title: Text('Vencimento de documentos'),
    );
  }

  Widget _buildBody() {
    return Table(
      defaultColumnWidth: IntrinsicColumnWidth(),
      border: TableBorder.all(),
      children: [
        _criarLinhaTable("Documento, Período"),
        _criarLinhaTable("RG, 10 Anos "),
        _criarLinhaTable("CPF, Indeterminado"),
        _criarLinhaTable("CNH, 5 Anos "),
        _criarLinhaTable("Certidão de nascimento, Indeterminado"),
      ],
    );
  }

  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(),
    );
  }
}
