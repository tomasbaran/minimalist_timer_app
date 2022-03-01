import 'package:flutter/material.dart';
import 'package:minimalist_timer_app/services/service_locator.dart';
import 'package:minimalist_timer_app/widgets/reset_button/reset_button_manager.dart';
import '../plain_button.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetController = getIt<ResetButtonManager>();
    return PlainButton(
      iconData: Icons.restart_alt,
      function: () => widgetController.reset(),
    );
  }
}
