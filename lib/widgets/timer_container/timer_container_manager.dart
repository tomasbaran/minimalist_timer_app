import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/widgets/timer_container/timer_container_notifier.dart';

class TimerContainerManager {
  final timerNotifier = getIt<TimerContainerNotifier>();

  init() => timerNotifier.loadTimeLeft();

  dispose() => timerNotifier.cancelTimer();
}
