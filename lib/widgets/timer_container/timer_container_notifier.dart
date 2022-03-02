import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/services/parse_service.dart';
import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/utils/constants.dart';
import 'dart:async';

import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';

class TimerContainerNotifier extends ValueNotifier<String> {
  TimerContainerNotifier() : super(ParseService().durationToTimerFormat(mkDefaultTimer));

  Timer? _timer;
  int _secondsLeft = ParseService().durationToSeconds(mkDefaultTimer);
  bool _isPaused = false;

  updateTimer(int newSecondsLeft) {
    _secondsLeft = newSecondsLeft;
    value = ParseService().secondsToTimerFormat(newSecondsLeft);
  }

  countDownUntilZero(Timer _localTimer) {
    final _buttonsNotifier = getIt<ButtonsContainerNotifier>();
    updateTimer(_secondsLeft - 1);

    if (_secondsLeft == 0) {
      _localTimer.cancel();
      _buttonsNotifier.value = ButtonsState.finished;
    }
  }

  play() {
    if (_isPaused) unpause();

    _timer = Timer.periodic(oneSec, (_localTimer) {
      if (!_isPaused) {
        countDownUntilZero(_localTimer);
      } else {
        _localTimer.cancel();
      }
    });
  }

  unpause() => _isPaused = false;

  pause() => _isPaused = true;

  reset() => updateTimer(ParseService().durationToSeconds(mkDefaultTimer));

  cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }
}
