import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/domain/notes/models/note.dart';
import 'package:notes_on_english_literature/pages/book/note_list/note_list_provider.dart';
import 'package:notes_on_english_literature/widgets/button/radius_button.dart';
import 'package:notes_on_english_literature/widgets/dialog/comfirm_dialog.dart';
import 'package:notes_on_english_literature/widgets/dialog/dialog_base.dart';
import 'package:notes_on_english_literature/widgets/image/book_image.dart';
import 'package:notes_on_english_literature/widgets/widgets.dart';

class UpdateBookDialog extends DialogBase<void> {
  const UpdateBookDialog({
    required this.controller,
    required this.selectingImage,
    required this.selectedNote,
  });

  final TextEditingController controller;
  final VoidCallback selectingImage;
  final Note selectedNote;

  @override
  List<Widget> dialogActions(BuildContext context) {
    final noteListNotifier = context.read(noteListNotifierProvider.notifier);

    return [
      RadiusButton(
        text: '削除する',
        textStyle: Theme.of(context).textTheme.bodyText2!,
        onTapLogic: () {
          ConfirmDialog(
            title: '注意',
            message: '本当にこの本を削除しますか？',
            confirmText: '削除する',
            onTapLogic: () {
              noteListNotifier.deleteNoteList(selectedNote);
              Navigator.of(context).pop();
            },
          ).show(context);
        },
      ).show(context),
      Consumer(
        builder: (context, watch, child) {
          final imageUrl = watch(noteListNotifierProvider).imageUrl;
          return RadiusButton(
            text: '編集',
            textStyle: Theme.of(context).textTheme.bodyText2!,
            onTapLogic: () {
              noteListNotifier.updateNoteList(
                Note(
                  noteId: selectedNote.noteId,
                  title: (controller.text.isEmpty)
                      ? selectedNote.title
                      : controller.text,
                  sentenceList: selectedNote.sentenceList,
                  imageUrl:
                      (imageUrl.isEmpty) ? selectedNote.imageUrl : imageUrl,
                ),
              );
              Navigator.of(context).pop();
            },
          ).show(context);
        },
      ),
    ];
  }

  @override
  Widget dialogContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Consumer(
        builder: (context, watch, child) {
          final imageUrl = watch(noteListNotifierProvider).imageUrl;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: AccentForm(
                  label: '題名を編集',
                  controller: controller,
                ),
              ),
              RadiusButton(
                text: '画像を編集する',
                textStyle: Theme.of(context).textTheme.bodyText2!,
                onTapLogic: selectingImage,
              ).show(context),
              const SizedBox(height: 16),
              if (selectedNote.imageUrl.isNotEmpty || imageUrl.isNotEmpty)
                SizedBox(
                  height: 240,
                  width: 240,
                  child: Consumer(builder: (context, watch, child) {
                    final imageUrlState =
                        watch(noteListNotifierProvider).imageUrl;
                    return BookImage(
                      title: (controller.text.isEmpty)
                          ? selectedNote.title
                          : controller.text,
                      image: (imageUrl.isEmpty)
                          ? (selectedNote.imageUrl.isEmpty)
                              ? imageUrlState
                              : selectedNote.imageUrl
                          : imageUrl,
                    );
                  }),
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
      '本の編集・削除',
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
