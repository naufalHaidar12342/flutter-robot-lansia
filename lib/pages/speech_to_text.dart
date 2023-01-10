import 'package:avatar_glow/avatar_glow.dart';
import 'package:companion_robot/api/speech_recognition_api.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class _SpeechTTState extends State<SpeechTT> {
  String parsedVoice = "Ini adalah teks awal";
  bool isListeningVoice = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman dua"),
        actions: [
          IconButton(
              onPressed: () async {
                await FlutterClipboard.copy(parsedVoice);
              },
              icon: const Icon(Icons.content_copy))
        ],
      ),
      body: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(30).copyWith(bottom: 150),
          child: Text(
            parsedVoice,
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w400),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AvatarGlow(
        animate: true,
        endRadius: 75,
        glowColor: Theme.of(context).primaryColor,
        child: FloatingActionButton(
          onPressed: activateRecording,
          child: Icon(
            isListeningVoice ? Icons.mic : Icons.mic_none,
            size: 40,
          ),
        ),
      ),
      
    );
  }
  Future activateRecording() => SpeechAPI.toggleRecording(
      onResult: (text) =>
          const SpeechTT().createState().setState(() => this.parsedVoice = text),
      onListening: (bool isListening) {
        const SpeechTT()
            .createState()
            .setState(() => this.isListeningVoice = isListening);
      });
}


class SpeechTT extends StatefulWidget {
  const SpeechTT({super.key});

  @override
  State<StatefulWidget> createState() => _SpeechTTState();
}
