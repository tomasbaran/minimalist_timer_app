import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/services/storage_services/local_storage.dart';
import 'package:minimalist_timer_app/utils/constants.dart';

enum ButtonsState {
  initial,
  started,
  paused,
  finished,
}

class ButtonsContainerNotifier extends ValueNotifier<ButtonsState> {
  ButtonsContainerNotifier() : super(mkDefaultButtonsState);

  loadButtonsState() async {
    value = await LocalStorage().getButtonsState() ?? mkDefaultButtonsState;
    updateAndSaveButtonsState(value);
  }

  updateAndSaveButtonsState(ButtonsState newButtonsState) {
    value = newButtonsState;
    LocalStorage().saveButtonsState(newButtonsState);
  }
}
