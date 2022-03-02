import 'package:minimalist_timer_app/services/storage_services/local_storage.dart';
import 'package:minimalist_timer_app/services/parse_service.dart';
import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/utils/constants.dart';
import 'package:minimalist_timer_app/widgets/timer_container/timer_container_notifier.dart';

class TimerContainerManager {
  final timerNotifier = getIt<TimerContainerNotifier>();

  init() {
    Duration _initTimeLeft = LocalStorage().getTimeLeft();
    timerNotifier.value = ParseService().durationToTimerFormat(_initTimeLeft);
  }

  dispose() => timerNotifier.cancelTimer();
}
