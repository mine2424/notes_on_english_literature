import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/widgets/button/button_base.dart';

class NeumorphismButton extends ButtonBase {
  const NeumorphismButton({required this.text, this.onTapLogic});

  final String text;
  final VoidCallback? onTapLogic;

  @override
  ButtonStyle buttonStyle(BuildContext context) {
    return Theme.of(context).elevatedButtonTheme.style!;
  }

  @override
  Widget textWidget(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

  @override
  void onPressed() => onTapLogic;
}
