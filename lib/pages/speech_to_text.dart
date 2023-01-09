import 'package:flutter/material.dart';

class SpeechToText extends StatelessWidget {
  const SpeechToText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman dua")),
      body: Center(
        child: ElevatedButton(
          onPressed: (){

          }, 
          child: const Text("go back")),),
    );
  }
}
