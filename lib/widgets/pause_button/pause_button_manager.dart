import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';
import 'package:minimalist_timer_app/widgets/timer_container/timer_container_notifier.dart';

class PauseButtonManager {
  pause() {
    final _timerNotifier = getIt<TimerContainerNotifier>();
    final _buttonsNotifier = getIt<ButtonsContainerNotifier>();

    _timerNotifier.pause();
    _buttonsNotifier.updateAndSaveButtonsState(ButtonsState.paused);
  }
}
