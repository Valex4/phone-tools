import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextScreen extends StatefulWidget {
  @override
  _SpeechToTextScreenState createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = "Presiona el micrófono para hablar";

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _startListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) => print('onStatus: $status'),
        onError: (errorNotification) => print('onError: $errorNotification'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (result) => setState(() {
            _text = result.recognizedWords;
          }),
        );
      } else {
        print("The user has denied the use of speech recognition.");
      }
    }
  }

  void _stopListening() {
    if (_isListening) {
      _speech.stop();
      setState(() => _isListening = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Reconocimiento de Voz",
          style: TextStyle(color: Colors.white)
          ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Texto resultado del reconocimiento de voz
            Text(
              _text,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60),
            // Botón del micrófono
            GestureDetector(
              onTap: _isListening ? _stopListening : _startListening,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isListening ? Colors.redAccent : Colors.blueAccent,
                ),
                child: Icon(
                  _isListening ? Icons.mic : Icons.mic_none,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Indicador de estado
            Text(
              _isListening ? "Escuchando..." : "Presiona para hablar",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}