import 'package:minimalist_timer_app/services/storage_services/storage_service.dart';
import 'package:minimalist_timer_app/utils/constants.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';

class LocalStorage extends StorageService {
  @override
  ButtonsState getButtonsState() {
    // TODO: implement getButtonsState
    try {
      throw 'buttonsState not retrieved from the local storage.';
    } catch (e) {
      return mkDefaultButtonsState;
    }
  }

  @override
  Duration getTimeLeft() {
    // TODO: implement getTimeLeft
    try {
      throw 'timeLeft not retrieved from the local storage.';
    } catch (e) {
      return mkDefaultTimer;
    }
  }

  @override
  Future saveState(Duration timeLeft, ButtonsState buttonsState) {
    // TODO: implement saveState
    throw 'Was not able to save to local storage.';
  }
}
