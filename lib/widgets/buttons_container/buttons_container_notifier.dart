import 'package:flutter/material.dart';

enum ButtonsState {
  initial,
  started,
  paused,
  finished,
}

class ButtonsContainerNotifier extends ValueNotifier<ButtonsState> {
  ButtonsContainerNotifier() : super(ButtonsState.initial);
}
