import 'package:flutter/material.dart';

abstract class ButtonBase {
  const ButtonBase();

  double get vertical;
  double get horizontal;

  double get innerVertical;
  double get innerHorizontal;

  void onPressed();

  ButtonStyle buttonStyle(BuildContext context);

  Widget textWidget(BuildContext context);

  Widget _button(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: innerHorizontal,
          vertical: innerVertical,
        ),
        child: textWidget(context),
      ),
      style: buttonStyle(context),
    );
  }

  Widget show(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: _button(context),
    );
  }
}
