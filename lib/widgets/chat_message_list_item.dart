import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tcc_regulariza/models/chat_message.dart';

class ChatMessageListItem extends StatelessWidget {
  //static const String routeName = '/chat';
  final ChatMessage chatMessage;

  ChatMessageListItem({this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return chatMessage.type == ChatMessageType.sent
        ? _showSentMessage()
        : _showReceivedMessage();
  }

  Widget _showSentMessage({EdgeInsets padding, TextAlign textAlign}) {
    // DESAFIO 1 - Melhorar a exibição das mensagens, aplicando um Clippy no estilo Whatsapp
    return Message(
      child: Container(
        color: Colors.yellow,
        width: 100.0,
        height: 100.0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(64.0, 0.0, 8.0, 0.0),
              trailing:
                  CircleAvatar(child: Text(chatMessage.name.toUpperCase()[0])),
              title: Text(chatMessage.name, textAlign: TextAlign.right),
              subtitle: Text(
                  chatMessage.text +
                      "\n" +
                      DateFormat("dd/MM/yyyy HH:mm").format(DateTime.now()),
                      // DESAFIO 2 - Adicionar data/hora de recebimento ou envio das mensagens (DateTime class)
                  textAlign: TextAlign.right),
            ),
          ),
        ),
      ),
      triangleX1: 260.0,
      triangleX2: 280.0,
      triangleX3: 280.0,
      triangleY1: 20.0,
    );
  }

  Widget _showReceivedMessage() {
    // DESAFIO 1 - Melhorar a exibição das mensagens, aplicando um Clippy no estilo Whatsapp
    return Message(
      child: Container(
        color: Colors.amberAccent,
        width: 100.0,
        height: 100.0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 64.0, 0.0),
              leading:
                  CircleAvatar(child: Text(chatMessage.name.toUpperCase()[0])),
              title: Text(chatMessage.name, textAlign: TextAlign.left),
              subtitle: Text(
                  chatMessage.text +
                      "\n" +
                      DateFormat("dd/MM/yyyy HH:mm").format(DateTime.now()),
                      // DESAFIO 2 - Adicionar data/hora de recebimento ou envio das mensagens (DateTime class)
                  textAlign: TextAlign.left),
            ),
          ),
        ),
      ),
      triangleX1: 60.0,
      triangleX2: 80.0,
      triangleX3: 60.0,
      triangleY1: 20.0,
    );
  }
}
