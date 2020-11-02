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
    return SingleChildScrollView(
        child: Table(
      defaultColumnWidth: IntrinsicColumnWidth(),
      border: TableBorder.all(),
      children: [
        _criarLinhaTable("Documento, Período"),
        _criarLinhaTable(
            "Passaporte para crianças de até 1 ano de idade incompleto, 1 ano"),
        _criarLinhaTable(
            "Passaporte para crianças de 1 a 2 anos incompletos de idade , 2 anos"),
        _criarLinhaTable(
            "Passaporte para crianças de 2 a 3 anos incompletos de idade, 3 anos"),
        _criarLinhaTable(
            "Passaporte para crianças de 3 a 4 anos incompletos de idade, 4 anos"),
        _criarLinhaTable("Passaporte 4 a 18 anos de idade incompletos, 5 anos"),
        _criarLinhaTable(
            "Passaporte para maiores de 18 anos de idade, 10 anos"),
        _criarLinhaTable("CNH - idade até 50 anos, 10 anos"),
        _criarLinhaTable("CNH - idade até 70 anos, 5 anos"),
        _criarLinhaTable("CNH - mais que 70 anos, 3 anos"),
        _criarLinhaTable(
            "CNH para aqueles que atuam profissionalmente com veiculo, 5 anos"),
        _criarLinhaTable(
            "RG (Não tem prazo - algumas instituições não aceitam documento com prazo maior que este), 10 anos"),
        _criarLinhaTable("CPF, 10 anos"),
        _criarLinhaTable("Certidão de Nascimento (atualizada), 12 meses"),
        _criarLinhaTable("Certidão de Casamento (atualizada), 12 meses"),
      ],
    ));
  }

  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(', ').map((name) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(),
    );
  }
}
