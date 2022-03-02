import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';

abstract class StorageService {
  Future<Duration> getTimeLeft();
  Future<ButtonsState?> getButtonsState();
  Future saveState(int secondsLeft, ButtonsState buttonsState);
}
