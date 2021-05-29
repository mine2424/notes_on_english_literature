import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/domain/notes/models/note.dart';
import 'package:notes_on_english_literature/pages/notes/note_list/note_list_provider.dart';
import 'package:notes_on_english_literature/widgets/button/radius_button.dart';
import 'package:notes_on_english_literature/widgets/dialog/dialog_base.dart';
import 'package:notes_on_english_literature/widgets/form/accent_form.dart';
import 'package:notes_on_english_literature/widgets/image/book_image.dart';

class AddBookDialog extends DialogBase<void> {
  const AddBookDialog({required this.controller, required this.selectingImage});

  final TextEditingController controller;
  final VoidCallback selectingImage;

  @override
  List<Widget> dialogActions(BuildContext context) {
    return [
      RadiusButton(
        text: 'キャンセル',
        textStyle: Theme.of(context).textTheme.bodyText2!,
        onTapLogic: () => Navigator.of(context).pop(),
      ).show(context),
      RadiusButton(
        text: '保存',
        textStyle: Theme.of(context).textTheme.bodyText2!,
        onTapLogic: () {
          context
              .read(noteListNotifierProvider.notifier)
              .addUpdateNoteListForLocalDB(
                Note(
                  title: controller.text,
                  imageUrl: context.read(noteListNotifierProvider).imagePath,
                ),
              );
          Navigator.of(context).pop();
        },
      ).show(context),
    ];
  }

  @override
  Widget dialogContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Consumer(
        builder: (context, watch, child) {
          final imagePath = watch(noteListNotifierProvider).imagePath;

          print(imagePath);

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: AccentForm(
                  label: '題名',
                  controller: controller,
                ),
              ),
              RadiusButton(
                text: '画像を選択する',
                textStyle: Theme.of(context).textTheme.bodyText2!,
                onTapLogic: selectingImage,
              ).show(context),
              const SizedBox(height: 16),
              if (imagePath != '')
                SizedBox(
                  height: 240,
                  width: 240,
                  child: BookImage(
                    title: controller.text,
                    image: File(imagePath),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget? dialogTitle(BuildContext context) {
    return Text(
      '本を作成',
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
