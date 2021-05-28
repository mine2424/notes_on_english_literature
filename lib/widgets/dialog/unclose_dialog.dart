import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UncloseDialog {
  const UncloseDialog({
    required this.closeAppOnBack,
    this.title,
    required this.content,
    required this.actions,
  });

  final bool closeAppOnBack;

  final String? title;
  final String content;

  final List<Widget> actions;

  Widget _dialog(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (closeAppOnBack && Platform.isAndroid) {
          await SystemNavigator.pop();
        }
        return false;
      },
      child: AlertDialog(
        scrollable: true,
        elevation: 24,
        title: (title == null) ? null : dialogTitle(context),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dialogContent(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: dialogActions(),
            ),
          ],
        ),
        actionsOverflowDirection: VerticalDirection.down,
        actionsOverflowButtonSpacing: 8,
      ),
    );
  }

  Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return _dialog(context);
      },
    );
  }

  Widget dialogTitle(BuildContext context) {
    return Text(
      title!,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  Widget dialogContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(content),
    );
  }

  List<Widget> dialogActions() {
    return actions;
  }
}
