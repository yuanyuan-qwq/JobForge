import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:speech_to_text/speech_to_text.dart';

import '../API.dart';

class ChatBotCTRL extends StatefulWidget {
  const ChatBotCTRL({super.key});

  @override
  _ChatBotCTRL createState() => _ChatBotCTRL();
}

class _ChatBotCTRL extends State<ChatBotCTRL> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final SpeechToText _speechToText = SpeechToText();

  @override
  void initState() {
    super.initState();
    _messages.add({
      'sender': 'Bot',
      'message':
          "Welcome to JobBot! What can I assist you with?\nHere some interest you need to know:\n1. What can this app do?\n2. How to use this app?"
    });
  }

  Future<void> _sendMessage(String text) async {
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({'sender': 'User', 'message': text});
        _controller.clear();
      });

      final response = await http.post(
        Uri.parse('http://$FastapiKey/chat?text=$text'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'text': text,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> message = jsonDecode(response.body);

        setState(() {
          _messages.add({'sender': 'Bot', 'message': message['response']});
        });
      } else {
        throw Exception('Failed to load response');
      }
    }
  }

  final ValueNotifier<bool> _isListening = ValueNotifier<bool>(false);

  void _startListening() async {
    bool available = await _speechToText.initialize();
    if (available) {
      setState(() {
        _isListening.value = true; // Update the listening state
      });

      bool isListening = await _speechToText.listen(
        onResult: (result) {
          setState(() {
            _controller.text = result.recognizedWords;
          });
        },
      );
    } else {
      print('The user denied the use of speech recognition.');
    }
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      _isListening.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 76, 153, 1),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: _buildMessages(),
                ),
              ),
            ),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMessages() {
    return _messages.map((message) {
      return Row(
        mainAxisAlignment: message['sender'] == 'User'
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: <Widget>[
          if (message['sender'] == 'Bot')
            const CircleAvatar(backgroundImage: AssetImage('images/logo.png')),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: message['sender'] == 'User'
                    ? const Color.fromARGB(176, 33, 100, 243)
                    : const Color.fromARGB(153, 255, 255, 0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                message['message']!,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                softWrap: true,
              ),
            ),
          ),
          if (message['sender'] == 'User')
            const CircleAvatar(backgroundImage: AssetImage('images/12.png')),
        ],
      );
    }).toList();
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: <Widget>[
            ValueListenableBuilder<bool>(
              valueListenable: _isListening,
              builder: (context, isListening, child) {
                return IconButton(
                  icon: Icon(
                    isListening ? Icons.stop : Icons.mic,
                    color: Colors.blue[100],
                  ),
                  onPressed: () {
                    isListening ? _stopListening() : _startListening();
                  },
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Enter your message',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: Colors.blue[100]),
              onPressed: () {
                _sendMessage(_controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
