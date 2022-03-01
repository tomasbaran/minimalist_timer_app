import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/widgets/pause_button/pause_button_manager.dart';
import '../plain_button.dart';

class PauseButton extends StatelessWidget {
  const PauseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetController = getIt<PauseButtonManager>();
    return PlainButton(
      iconData: Icons.pause,
      function: () => widgetController.pause(),
    );
  }
}
