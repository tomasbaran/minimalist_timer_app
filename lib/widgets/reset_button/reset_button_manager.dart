import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';
import 'package:minimalist_timer_app/widgets/timer_container/timer_container_notifier.dart';

class ResetButtonManager {
  reset() {
    final _timerNotifier = getIt<TimerContainerNotifier>();
    final _buttonsNotifier = getIt<ButtonsContainerNotifier>();

    _timerNotifier.reset();
    // HANDLES: 1. timer on [ButtonsState.started] 2. tap on reset button 3. ButtonsState should NOT get changed
    if (_buttonsNotifier.value != ButtonsState.started) _buttonsNotifier.updateAndSaveButtonsState(ButtonsState.initial);
  }
}
