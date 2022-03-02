import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';

class ButtonsContainerManager {
  final buttonsNotifier = getIt<ButtonsContainerNotifier>();

  init() => buttonsNotifier.loadButtonsState();
}
