import 'package:flutter/material.dart';

abstract class DialogBase<T> {
  const DialogBase();

  Widget _dialog(BuildContext context) {
    final title = dialogTitle(context);

    return AlertDialog(
      scrollable: true,
      elevation: 24,
      title: (title == null) ? null : title,
      insetPadding: const EdgeInsets.all(8),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: double.infinity, child: dialogContent(context)),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: dialogActions(context),
          ),
        ],
      ),
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

  Widget? dialogTitle(BuildContext context);

  Widget dialogContent(BuildContext context);

  List<Widget> dialogActions(BuildContext context);
}
