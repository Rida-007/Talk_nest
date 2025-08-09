import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const FakeMessagingApp());
}

class FakeMessagingApp extends StatelessWidget {
  const FakeMessagingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clickbait Messenger 🤡',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const LoginScreen(),
    );
  }
}