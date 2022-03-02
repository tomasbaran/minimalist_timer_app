import 'package:minimalist_timer_app/services/storage_services/local_storage.dart';
import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/utils/constants.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';

class ButtonsContainerManager {
  final buttonsNotifier = getIt<ButtonsContainerNotifier>();
  init() async => buttonsNotifier.value = await LocalStorage().getButtonsState() ?? mkDefaultButtonsState;
}
