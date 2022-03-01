import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/parse_service.dart';
import 'package:minimalist_timer_app/utils/constants.dart';

class TimerContainerNotifier extends ValueNotifier<String> {
  TimerContainerNotifier() : super(ParseService().durationToTimerFormat(mkDefaultTimer));
}
