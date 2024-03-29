import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:linkable/linkable.dart';
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

  Widget _showSentMessage() {
    // DESAFIO 1 - Melhorar a exibição das mensagens, aplicando um Clippy no estilo Whatsapp
    return Message(
      child: Container(
        color: Colors.yellow,
        width: 100.0,
        height: chatMessage.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(64.0, 0.0, 8.0, 0.0),
              trailing:
                  CircleAvatar(child: Text(chatMessage.name.toUpperCase()[0])),
              title: Text(chatMessage.name, textAlign: TextAlign.right),
              subtitle: Text(chatMessage.text, textAlign: TextAlign.right),
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
        height: chatMessage.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 64.0, 0.0),
              leading:
                  CircleAvatar(child: Text(chatMessage.name.toUpperCase()[0])),
              title: Text(chatMessage.name, textAlign: TextAlign.left),
              subtitle: Linkable(
                  text:
                      // se a altura é nula, exibe todo o texto.
                      // se a altura não é nula, exibe apenas o início do texto,
                      // seguido da opção 'Ver mais'
                      chatMessage.height == null
                          ? chatMessage.text
                          : chatMessage.text.substring(
                                  0, (0.7 * chatMessage.height).round()) +
                              "...\n\nVer mais",
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
