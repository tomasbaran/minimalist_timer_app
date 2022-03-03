import 'package:get_it/get_it.dart';
import 'package:minimalist_timer_app/services/timer_service.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';
import 'package:minimalist_timer_app/widgets/timer_container/timer_container_manager.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_manager.dart';
import 'package:minimalist_timer_app/widgets/pause_button/pause_button_manager.dart';
import 'package:minimalist_timer_app/widgets/play_button/play_button_manager.dart';
import 'package:minimalist_timer_app/widgets/reset_button/reset_button_manager.dart';
import 'package:minimalist_timer_app/widgets/timer_container/timer_container_notifier.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerFactory<ButtonsContainerManager>(() => ButtonsContainerManager());
  getIt.registerFactory<PlayButtonManager>(() => PlayButtonManager());
  getIt.registerFactory<ResetButtonManager>(() => ResetButtonManager());
  getIt.registerFactory<PauseButtonManager>(() => PauseButtonManager());
  getIt.registerFactory<TimerContainerManager>(() => TimerContainerManager());

  getIt.registerLazySingleton<TimerService>(() => TimerService());
  getIt.registerLazySingleton<TimerContainerNotifier>(() => TimerContainerNotifier());
  getIt.registerLazySingleton<ButtonsContainerNotifier>(() => ButtonsContainerNotifier());
}
