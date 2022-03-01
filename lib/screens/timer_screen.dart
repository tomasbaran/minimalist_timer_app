import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container.dart';
import 'package:minimalist_timer_app/widgets/timer_container/timer_container.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            TimerContainer(),
            SizedBox(height: 24),
            ButtonsContainer(),
          ],
        ),
      ),
    );
  }
}
