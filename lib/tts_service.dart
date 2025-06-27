import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  final FlutterTts _tts = FlutterTts();
  
  Future<void> init() async {
    await _tts.setLanguage("en-IN");
    await _tts.setVoice({"name": "en-in-x-afb-network"}); 
    await _tts.awaitSpeakCompletion(true);
  }

  void speak(String text, {String emotion = "neutral"}) {
    String ssml = _applyEmotion(text, emotion);
    _tts.speak(ssml);
  }

  String _applyEmotion(String text, String emotion) {
    Map<String, Map<String, dynamic>> emotions = {
      "happy": {"rate": "120%", "pitch": "110%"},
      "sad": {"rate": "80%", "pitch": "90%"},
      "angry": {"rate": "130%", "pitch": "85%"},
      "neutral": {"rate": "100%", "pitch": "100%"},
    };
    
    return '''
    <speak>
      <prosody rate="${emotions[emotion]!['rate']}" 
               pitch="${emotions[emotion]!['pitch']}">
        $text
      </prosody>
    </speak>
    ''';
  }
}