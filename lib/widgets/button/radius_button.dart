import 'package:flutter/material.dart';

import 'package:notes_on_english_literature/widgets/button/button_base.dart';

class RadiusButton extends ButtonBase {
  const RadiusButton({
    required this.text,
    required this.textStyle,
    required this.onTapLogic,
  });

  final String text;
  final VoidCallback onTapLogic;
  final TextStyle textStyle;

  @override
  ButtonStyle buttonStyle(BuildContext context) {
    return Theme.of(context)
        .elevatedButtonTheme
        .style!
        .copyWith(shape: MaterialStateProperty.all(const StadiumBorder()));
  }

  @override
  double get horizontal => 8;

  @override
  double get vertical => 8;

  @override
  double get innerHorizontal => 16;

  @override
  double get innerVertical => 8;

  @override
  Widget textWidget(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }

  @override
  VoidCallback get onPressed => onTapLogic;
}
