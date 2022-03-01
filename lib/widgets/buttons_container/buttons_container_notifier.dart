import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/utils/constants.dart';

enum ButtonsState {
  initial,
  started,
  paused,
  finished,
}

class ButtonsContainerNotifier extends ValueNotifier<ButtonsState> {
  ButtonsContainerNotifier() : super(mkDefaultButtonsState);
}
