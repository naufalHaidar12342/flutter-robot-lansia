import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechAPI {
  static final _speech = SpeechToText();

  static Future<bool> toggleRecording({
    required Function(String text) onResult,
    required ValueChanged<bool> onListening,
  }) async {
    final isAvailable = await _speech.initialize(
      onStatus: (status) => onListening(_speech.isListening),
      onError: (errorNotification) =>
          debugPrint("Error muncul: $errorNotification"),
    );

    if (isAvailable) {
      _speech.listen(
        onResult: (result) => onResult(result.recognizedWords),
      );
    }
    if (_speech.isListening) {
      _speech.stop();
      return true;
    }
    return isAvailable;
  }
}
