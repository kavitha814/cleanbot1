// main.dart
import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const CleaningBotApp());
}

class CleaningBotApp extends StatelessWidget {
  const CleaningBotApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Cleaning Bot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}