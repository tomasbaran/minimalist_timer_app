import 'package:get_it/get_it.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';
import 'package:minimalist_timer_app/widgets/timer_container/timer_container_manager.dart';
import 'package:minimalist_timer_app/services/timer_service.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_manager.dart';
import 'package:minimalist_timer_app/widgets/pause_button/pause_button_manager.dart';
import 'package:minimalist_timer_app/widgets/play_button/play_button_manager.dart';
import 'package:minimalist_timer_app/widgets/reset_button/reset_button_manager.dart';
import 'package:minimalist_timer_app/widgets/timer_container/timer_container_notifier.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerLazySingleton<ButtonsContainerManager>(() => ButtonsContainerManager());
  getIt.registerLazySingleton<ButtonsContainerNotifier>(() => ButtonsContainerNotifier());
  getIt.registerLazySingleton<PlayButtonManager>(() => PlayButtonManager());
  getIt.registerLazySingleton<ResetButtonManager>(() => ResetButtonManager());
  getIt.registerLazySingleton<PauseButtonManager>(() => PauseButtonManager());
  getIt.registerLazySingleton<TimerContainerManager>(() => TimerContainerManager());
  getIt.registerLazySingleton<TimerContainerNotifier>(() => TimerContainerNotifier());
}
