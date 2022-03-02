import 'package:minimalist_timer_app/services/parse_service.dart';
import 'package:minimalist_timer_app/services/storage_services/storage_service.dart';
import 'package:minimalist_timer_app/utils/constants.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends StorageService {
  @override
  Future<ButtonsState?> getButtonsState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? buttonStateString = prefs.getString(buttonsStateKey);
      switch (buttonStateString) {
        case 'ButtonsState.initial':
          return ButtonsState.initial;
        case 'ButtonsState.started':
          return ButtonsState.paused;
        case 'ButtonsState.paused':
          return ButtonsState.paused;
        case 'ButtonsState.finished':
          return ButtonsState.finished;
        default:
          return null;
      }
    } catch (e) {
      throw 'buttonsState not retrieved from the local storage: $e';
    }
  }

  @override
  Future<Duration> getTimeLeft() async {
    int allSeconds;
    try {
      final prefs = await SharedPreferences.getInstance();
      allSeconds = prefs.getInt(timeLeftKey) ?? ParseService().durationToSeconds(mkDefaultTimer);
    } catch (e) {
      throw 'timeLeft not retrieved from the local storage: $e';
      // return mkDefaultTimer;
    }
    return ParseService().secondsToDuration(allSeconds);
  }

  @override
  Future saveTimeLeft(int secondsLeft) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt(timeLeftKey, secondsLeft);
    } catch (e) {
      throw 'Was not able to save to local storage: $e';
    }
  }

  @override
  Future saveButtonsState(ButtonsState buttonsState) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(buttonsStateKey, buttonsState.toString());
    } catch (e) {
      throw 'Was not able to save to local storage: $e';
    }
  }
}
