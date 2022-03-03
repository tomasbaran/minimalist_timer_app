import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/services/timer_service.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';

class ResetButtonManager {
  reset() {
    final _timerService = getIt<TimerService>();
    final _buttonsNotifier = getIt<ButtonsContainerNotifier>();

    _timerService.reset();
    // HANDLES: 1. timer on [ButtonsState.started] 2. tap on reset button 3. ButtonsState should NOT get changed
    if (_buttonsNotifier.value != ButtonsState.started) _buttonsNotifier.updateAndSaveButtonsState(ButtonsState.initial);
  }
}
