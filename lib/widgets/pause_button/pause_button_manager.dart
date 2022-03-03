import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/services/timer_service.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';

class PauseButtonManager {
  pause() {
    final _buttonsNotifier = getIt<ButtonsContainerNotifier>();
    final _timerService = getIt<TimerService>();

    _buttonsNotifier.updateAndSaveButtonsState(ButtonsState.paused);
    _timerService.pause();
  }
}
