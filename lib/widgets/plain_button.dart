import 'package:flutter/material.dart';

class PlainButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback function;
  // ignore: use_key_in_widget_constructors
  const PlainButton({
    required this.iconData,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: CircleAvatar(
        child: Icon(iconData, size: 44),
        radius: 40,
      ),
    );
  }
}
