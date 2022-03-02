import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/services/parse_service.dart';
import 'package:minimalist_timer_app/utils/constants.dart';
import 'dart:async';

class TimerContainerNotifier extends ValueNotifier<String> {
  TimerContainerNotifier() : super(ParseService().durationToTimerFormat(mkDefaultTimer));

  Timer? _timer;
  int _secondsLeft = ParseService().durationToSeconds(mkDefaultTimer);

  play() {
    _timer = Timer.periodic(oneSec, (_localTimer) {
      _secondsLeft--;
      value = ParseService().secondsToTimerFormat(_secondsLeft);
      if (_secondsLeft == 0) {
        _localTimer.cancel();
      }
    });
  }

  pause() {}

  reset() {}
}
