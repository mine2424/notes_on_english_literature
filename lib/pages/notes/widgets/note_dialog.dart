import 'package:flutter/material.dart';

import 'package:notes_on_english_literature/widgets/dialog/dialog_base.dart';
import 'package:notes_on_english_literature/widgets/form/accent_form.dart';

class BookDialog extends DialogBase<void> {
  const BookDialog({required this.controller});

  final TextEditingController controller;

  @override
  List<Widget>? dialogActions() {
    return [
      TextButton(onPressed: () {}, child: const Text('キャンセル')),
      TextButton(onPressed: () {}, child: const Text('保存')),
    ];
  }

  @override
  Widget dialogContent() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          AccentForm(
            label: 'book name',
            controller: controller,
          )
        ],
      ),
    );
  }

  @override
  Widget? dialogTitle() {
    return const Text('本を作成');
  }
}
