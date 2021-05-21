import 'package:flutter/material.dart';

abstract class DialogBase<T> {
  const DialogBase();

  Widget _dialog(BuildContext context) {
    final title = dialogTitle();

    return AlertDialog(
      scrollable: true,
      elevation: 24,
      title: (title == null) ? null : title,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          dialogContent(),
        ],
      ),
      actions: dialogActions(),
      actionsOverflowButtonSpacing: 24,
    );
  }

  Future<T?> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return _dialog(context);
      },
    );
  }

  Widget? dialogTitle();

  Widget dialogContent();

  List<Widget>? dialogActions();
}
