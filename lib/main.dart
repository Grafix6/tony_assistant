import 'package:flutter/material.dart';
import 'background_service.dart';
import 'tts_service.dart';

void main() {
  runApp(const MyApp());
  BackgroundListener().init();
  TTSService().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("TONY IS ACTIVE", 
                style: TextStyle(color: Colors.blue, fontSize: 24)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => BackgroundListener().init(),
                child: const Text("RESTART SERVICE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}