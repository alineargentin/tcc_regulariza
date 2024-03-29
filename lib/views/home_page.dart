import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tcc_regulariza/models/chat_message.dart';
import 'package:tcc_regulariza/widgets/chat_message_list_item.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:tcc_regulariza/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _messageList = <ChatMessage>[];
  final _controllerText = new TextEditingController();

  /// Tamanho máximo da altura de um item da lista colapsado
  static const double CHAT_ITEM_MAX_HEIGHT = 200;

  @override
  void dispose() {
    super.dispose();
    _controllerText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: new AppBar(
        title: Text('Chatbot - Cartório'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo_cartorio_facil.png"),
            fit: BoxFit.contain,
            colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(0.3), BlendMode.dstATop),
          ),
        ),
        child: Column(
          children: <Widget>[
            _buildList(),
            Divider(height: 1.0),
            _buildUserInput(),
          ],
        ),
      ),
    );
  }

  // Cria a lista de mensagens (de baixo para cima)
  Widget _buildList() {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        reverse: true,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: ChatMessageListItem(chatMessage: _messageList[index]),
              onTap: () {
                setState(() {
                  // clicar em um elemento da lista faz com que a altura seja
                  // nula, para cobrir o caso em que o texto é grande e a opção
                  // 'Ver mais' aparece
                  _messageList[index].height = null;
                });
              });
        },
        itemCount: _messageList.length,
      ),
    );
  }

  Future _dialogFlowRequest({String query}) async {
    // Adiciona uma mensagem temporária na lista
    _addMessage(
        name: 'Cartorário',
        text: 'Escrevendo...',
        type: ChatMessageType.received);

    // Faz a autenticação com o serviço, envia a mensagem e recebe uma resposta da Intent
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/credentials.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: "pt-BR");
    AIResponse response = await dialogflow.detectIntent(query);

    // remove a mensagem temporária
    setState(() {
      _messageList.removeAt(0);
    });

    double height;
    if (response.getMessage().length > CHAT_ITEM_MAX_HEIGHT) {
      // se o tamanho da resposta for grande, limita a altura da mensagem
      height = CHAT_ITEM_MAX_HEIGHT;
    }
    // adiciona a mensagem com a resposta do DialogFlow
    _addMessage(
        name: 'Cartorário',
        text: response.getMessage() ?? '',
        type: ChatMessageType.received,
        height: height);
  }

  // Envia uma mensagem com o padrão a direita
  void _sendMessage({String text}) {
    _controllerText.clear();
    _addMessage(name: 'Usuário', text: text, type: ChatMessageType.sent);
  }

  // Adiciona uma mensagem na lista de mensagens
  void _addMessage(
      {String name, String text, ChatMessageType type, double height}) {
    var message = ChatMessage(
        text:
            // acrescenta hora ao início da mensagem
            DateFormat("dd/MM/yyyy HH:mm").format(DateTime.now()) + "\n" + text,
        name: name,
        type: type,
        height: height);
    setState(() {
      _messageList.insert(0, message);
    });

    if (type == ChatMessageType.sent) {
      // Envia a mensagem para o chatbot e aguarda sua resposta
      _dialogFlowRequest(query: text);
    }
  }

  // Campo para escrever a mensagem
  Widget _buildTextField() {
    return new Flexible(
      child: new TextField(
        controller: _controllerText,
        decoration: new InputDecoration(
            // DESAFIO 3 - Fazer o TextField de envio de mensagens ser igual ao do Whatsapp (borda redonda)
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(50.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: Colors.grey[800]),
            hintText: "Enviar mensagem",
            fillColor: Colors.white70),
      ),
    );
  }

  // Botão para enviar a mensagem
  Widget _buildSendButton() {
    return new Container(
      margin: new EdgeInsets.only(left: 8.0),
      child: new IconButton(
          icon: new Icon(Icons.send, color: Theme.of(context).accentColor),
          onPressed: () {
            if (_controllerText.text.isNotEmpty) {
              _sendMessage(text: _controllerText.text);
            }
          }),
    );
  }

  // Monta uma linha com o campo de text e o botão de enviao
  Widget _buildUserInput() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          _buildTextField(),
          _buildSendButton(),
        ],
      ),
    );
  }
}
