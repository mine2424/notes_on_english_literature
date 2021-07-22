import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/di_container.dart';

import 'package:notes_on_english_literature/pages/notes/note/note_page.dart';
import 'package:notes_on_english_literature/pages/notes/note_list/note_list_provider.dart';
import 'package:notes_on_english_literature/pages/notes/note_list/widgets/add_note_dialog.dart';
import 'package:notes_on_english_literature/pages/notes/note_list/widgets/edit_note_dialog.dart';
import 'package:notes_on_english_literature/widgets/button/floating_custom_button.dart';
import 'package:notes_on_english_literature/widgets/image/book_image.dart';

class NoteListPage extends HookWidget {
  const NoteListPage();

  @override
  Widget build(BuildContext context) {
    final bookNameController = useTextEditingController.fromValue(
      TextEditingValue.empty,
    );

    final noteListNotifier = context.read(noteListNotifierProvider.notifier);
    final noteList = useProvider(noteListNotifierProvider).noteList;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 8,
          ),
          itemCount: noteList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: GestureDetector(
                onTap: () {
                  context
                      .read(appNotifierProvider.notifier)
                      .push(NotePage(noteList[index]));
                },
                onLongPress: () {
                  EditBookDialog(
                    controller: bookNameController,
                    selectedNote: noteList[index],
                    selectingImage: () {
                      noteListNotifier
                          .selectedImageFromGallary(bookNameController.text);
                    },
                  ).show(context);
                },
                child: BookImage(
                  title: noteList[index].title,
                  image: noteList[index].imageUrl,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingCustomButton(
        iconData: Icons.add,
        label: 'Add Note',
        onPressed: () {
          AddNoteDialog(
            controller: bookNameController,
            selectingImage: () {
              noteListNotifier.selectedImageFromGallary(
                bookNameController.text,
              );
            },
          ).show(context);
        },
      ),
    );
  }
}
