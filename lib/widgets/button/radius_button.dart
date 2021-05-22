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
  double get horizontal => 32;

  @override
  double get vertical => 8;

  @override
  double get innerHorizontal => 24;

  @override
  double get innerVertical => 8;

  @override
  void onPressed() => onTapLogic;

  @override
  Widget textWidget(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
    );
  }
}
