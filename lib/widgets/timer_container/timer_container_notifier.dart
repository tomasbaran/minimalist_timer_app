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

  countDownUntilZero(Timer _localTimer) {
    final _buttonsNotifier = getIt<ButtonsContainerNotifier>();
    _secondsLeft--;
    value = ParseService().secondsToTimerFormat(_secondsLeft);
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

  reset() {}
}
