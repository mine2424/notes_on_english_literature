import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/widgets/button/radius_button.dart';

import 'package:notes_on_english_literature/widgets/dialog/dialog_base.dart';

class ConfirmDialog extends DialogBase<void> {
  const ConfirmDialog({
    required this.title,
    required this.message,
    required this.confirmText,
    required this.onTapLogic,
  });

  final String title;
  final String message;
  final String confirmText;
  final VoidCallback onTapLogic;

  @override
  List<Widget> dialogActions(BuildContext context) {
    return [
      RadiusButton(
        text: 'キャンセル',
        textStyle: Theme.of(context).textTheme.bodyText2!,
        onTapLogic: () => Navigator.of(context).pop(),
      ).show(context),
      RadiusButton(
        text: confirmText,
        textStyle: Theme.of(context).textTheme.bodyText2!,
        onTapLogic: onTapLogic,
      ).show(context),
    ];
  }

  @override
  Widget dialogContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(message),
    );
  }

  @override
  Widget? dialogTitle(BuildContext context) {
    return Text(title);
  }
}
