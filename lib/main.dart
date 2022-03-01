import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/screens/timer_screen.dart';
import 'package:minimalist_timer_app/services/service_locator.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Minimalist Timer',
      home: TimerScreen(title: 'Minimalist Timer'),
    );
  }
}
