import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';

abstract class StorageService {
  Duration getTimeLeft();
  ButtonsState getButtonsState();
  Future saveState(Duration timeLeft, ButtonsState buttonsState);
}
