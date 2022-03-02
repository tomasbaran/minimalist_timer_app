import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/widgets/timer_container/timer_container_manager.dart';
import 'package:minimalist_timer_app/services/service_locator.dart';

class TimerContainer extends StatefulWidget {
  const TimerContainer({Key? key}) : super(key: key);

  @override
  State<TimerContainer> createState() => _TimerContainerState();
}

class _TimerContainerState extends State<TimerContainer> {
  final TimerContainerManager _widgetController = getIt<TimerContainerManager>();

  @override
  void initState() {
    super.initState();
    _widgetController.init();
  }

  @override
  void dispose() {
    _widgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
        valueListenable: _widgetController.timerNotifier,
        builder: (_, timer, __) {
          print('timer: $timer');
          return Text(
            timer,
            style: const TextStyle(fontSize: 70, fontWeight: FontWeight.w700),
          );
        });
  }
}
