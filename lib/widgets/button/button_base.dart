import 'package:flutter/material.dart';

abstract class ButtonBase {
  const ButtonBase();

  void onPressed();

  ButtonStyle buttonStyle(BuildContext context);

  Widget textWidget(BuildContext context);

  Widget _button(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: textWidget(context),
      style: buttonStyle(context),
    );
  }

  Widget show(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: _button(context),
    );
  }
}
