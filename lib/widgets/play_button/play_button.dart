import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/widgets/play_button/play_button_manager.dart';
import '../plain_button.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayButtonManager widgetController = getIt<PlayButtonManager>();
    return PlainButton(
      iconData: Icons.play_arrow,
      function: () => widgetController.play(),
    );
  }
}
