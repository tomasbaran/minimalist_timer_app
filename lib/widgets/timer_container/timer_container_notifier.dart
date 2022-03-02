import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/services/parse_service.dart';
import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/services/storage_services/local_storage.dart';
import 'package:minimalist_timer_app/utils/constants.dart';
import 'dart:async';

import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';

class TimerContainerNotifier extends ValueNotifier<String> {
  TimerContainerNotifier() : super(ParseService().durationToTimerFormat(mkDefaultTimer));

  final _buttonsNotifier = getIt<ButtonsContainerNotifier>();
  Timer? _timer;
  int _secondsLeft = ParseService().durationToSeconds(mkDefaultTimer);
  bool _isPaused = false;

  loadTimeLeft() async {
    Duration _initTimeLeft = await LocalStorage().getTimeLeft();
    updateAndSaveTimeLeft(ParseService().durationToSeconds(_initTimeLeft));
  }

  updateAndSaveTimeLeft(int newSecondsLeft) {
    _secondsLeft = newSecondsLeft;
    value = ParseService().secondsToTimerFormat(newSecondsLeft);
    LocalStorage().saveTimeLeft(_secondsLeft);
  }

  countDownUntilZero(Timer _localTimer) {
    updateAndSaveTimeLeft(_secondsLeft - 1);

    if (_secondsLeft == 0) {
      _localTimer.cancel();
      _buttonsNotifier.updateAndSaveButtonsState(ButtonsState.finished);
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

  reset() => updateAndSaveTimeLeft(ParseService().durationToSeconds(mkDefaultTimer));

  cancelTimer() {
    if (_timer != null) {
      // null-check
      _timer!.cancel();
    }
  }
}
