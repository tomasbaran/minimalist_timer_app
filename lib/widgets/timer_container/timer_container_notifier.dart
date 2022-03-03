import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/services/parse_service.dart';
import 'package:minimalist_timer_app/services/storage_services/local_storage.dart';
import 'package:minimalist_timer_app/utils/constants.dart';

class TimerContainerNotifier extends ValueNotifier<String> {
  TimerContainerNotifier() : super(ParseService().durationToTimerFormat(mkDefaultTimer));

  loadTimeLeft() async {
    Duration _initTimeLeft = await LocalStorage().getTimeLeft();
    updateAndSave(ParseService().durationToSeconds(_initTimeLeft));
  }

  updateAndSave(int newSecondsLeft) {
    value = ParseService().secondsToTimerFormat(newSecondsLeft);
    LocalStorage().saveTimeLeft(newSecondsLeft);
  }
}
