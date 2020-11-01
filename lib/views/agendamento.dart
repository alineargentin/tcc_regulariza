import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:tcc_regulariza/service/calendar_client.dart';

class Agendamento extends StatefulWidget {
  static const String routeName = '/Agendamento';
  @override
  _AgendamentoState createState() => _AgendamentoState();
}

class _AgendamentoState extends State<Agendamento> {
  CalendarClient calendarClient = CalendarClient();
  DateTime startTime = DateTime.now();
  TextEditingController _eventName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2020, 11, 1),
                        maxTime: DateTime(2022, 12, 31), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      setState(() {
                        this.startTime = date;
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.pt);
                  },
                  child: Text(
                    'Data do agendamento',
                    style: TextStyle(color: Colors.blue),
                  )),
              Text('$startTime'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _eventName,
              decoration:
                  InputDecoration(hintText: 'Insira o assunto a ser tratado'),
            ),
          ),
          RaisedButton(
              child: Text(
                'Confirmar agendamento',
              ),
              color: Colors.grey,
              onPressed: () {
                //log('add event pressed');
                calendarClient.insert(
                  _eventName.text,
                  startTime,
                  DateTime.now().add(Duration(hours: 1)),
                );
              }),
        ],
      ),
    );
  }
}
