import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_manager.dart';
import 'package:minimalist_timer_app/widgets/buttons_container/buttons_container_notifier.dart';
import '../play_button/play_button.dart';
import '../reset_button/reset_button.dart';
import '../pause_button/pause_button.dart';

class ButtonsContainer extends StatefulWidget {
  const ButtonsContainer({Key? key}) : super(key: key);

  @override
  State<ButtonsContainer> createState() => _ButtonsContainerState();
}

class _ButtonsContainerState extends State<ButtonsContainer> {
  final _widgetController = getIt<ButtonsContainerManager>();

  @override
  void initState() {
    super.initState();
    _widgetController.init();
  }

  List<Widget> buttonsChildren(ButtonsState _state) {
    List<Widget> _output = [];
    switch (_state) {
      case ButtonsState.initial:
        _output.add(const PlayButton());
        break;
      case ButtonsState.started:
        _output.add(const PauseButton());
        _output.add(const SizedBox(width: 24));
        _output.add(const ResetButton());
        break;
      case ButtonsState.paused:
        _output.add(const PlayButton());
        _output.add(const SizedBox(width: 24));
        _output.add(const ResetButton());
        break;
      case ButtonsState.finished:
        _output.add(const ResetButton());
        break;

      default:
    }
    return _output;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ButtonsState>(
        valueListenable: _widgetController.buttonsNotifier,
        builder: (_, _buttonsState, __) {
          print('buttonsState: $_buttonsState');
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buttonsChildren(_buttonsState),
          );
        });
  }
}
