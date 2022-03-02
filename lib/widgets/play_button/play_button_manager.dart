import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';
import 'package:minimalist_timer_app/widgets/timer_container/timer_container_notifier.dart';

class PlayButtonManager {
  play() {
    final _timerNotifier = getIt<TimerContainerNotifier>();
    final _buttonNotifier = getIt<ButtonsContainerNotifier>();

    _timerNotifier.play();
    _buttonNotifier.value = ButtonsState.started;
  }
}
