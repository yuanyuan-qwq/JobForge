
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';



class speech_Home extends StatefulWidget{

  const speech_Home({super.key});
  @override
  State<StatefulWidget> createState() =>_speech_Home();

}

class _speech_Home extends State<speech_Home>{
  
  final SpeechToText _speechToText = SpeechToText();
  
  bool _speechEnabled = false;
  String _wordSpoken = "";
  double _confidenceLevel = 0;
  String _confirmedText = "";

  @override
  void initState(){
    super.initState();
    initSpeech();
  }

  void initSpeech() async{
    _speechEnabled = await _speechToText.initialize();
    setState(() {
      
    });
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {

    });
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordSpoken = "${result.recognizedWords}";
      _confidenceLevel = result.confidence;

    });


    // Pass the spoken text back to the search page
  }

  void _confirmText() {
    Navigator.pop(context, _wordSpoken);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 51, 102, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 51, 102, 1),
        title: Text(
            "Speech To Text",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                _speechToText.isListening
                    ? "Listening..."
                    : _speechEnabled
                      ? "Tap the microphone to start listening....."
                      : "Speech not available",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  _wordSpoken,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            if (_speechToText.isNotListening && _confidenceLevel > 0)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 100,
                ),
                child: Text(
                  "Confidence: ${(_confidenceLevel * 100).toStringAsFixed(1)}%",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ElevatedButton(
                onPressed: _confirmText ,
                child: Text(
                  "confrim",
                ) )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Listen",
        child: Icon(
          _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
          color: Colors.white,
        ),
        backgroundColor: Colors.lightBlue,
        onPressed: _speechToText.isListening ? _stopListening : _startListening,
      ),
    );

  }


  
  

  
  
  
}