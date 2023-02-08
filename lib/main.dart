import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "text to speech",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Speech to text")),
        body: Center(child: Texttospeech()),
      ),
    );
  }
}

class Texttospeech extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();
  speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(0.8);
    await flutterTts.speak(text);
  }

  Texttospeech({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: textEditingController,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text("text to speech"),
                  onPressed: () => speak(textEditingController.text),
                )
              ],
            )));
  }
}
