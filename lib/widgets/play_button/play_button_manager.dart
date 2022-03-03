import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/services/timer_service.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';

class PlayButtonManager {
  play() {
    final _timerService = getIt<TimerService>();
    final _buttonNotifier = getIt<ButtonsContainerNotifier>();

    _timerService.play();
    _buttonNotifier.updateAndSaveButtonsState(ButtonsState.started);
  }
}
