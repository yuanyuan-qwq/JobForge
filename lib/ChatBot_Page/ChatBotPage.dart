import 'package:flutter/material.dart';

import 'ChatController/ChatBotCRTL.dart';

class ChatBotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 76, 153, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 51, 102, 1),
        elevation: 0.0,
        title: Text(
          "ChatBot",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ChatBotCTRL(),
      ),
    );
  }
}
