import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/services/timer_service.dart';
import 'package:minimalist_timer_app/widgets/timer_container/timer_container_notifier.dart';

class TimerContainerManager {
  final _timerService = getIt<TimerService>();
  final timerNotifier = getIt<TimerContainerNotifier>();

  init() => timerNotifier.loadTimeLeft();

  dispose() => _timerService.cancelTimer();
}
