import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/di_container.dart';

import 'package:notes_on_english_literature/pages/book/note/note_page.dart';
import 'package:notes_on_english_literature/pages/book/note/note_page_provider.dart';
import 'package:notes_on_english_literature/pages/book/note_list/note_list_provider.dart';
import 'package:notes_on_english_literature/pages/book/note_list/widgets/add_note_dialog.dart';
import 'package:notes_on_english_literature/pages/book/note_list/widgets/update_note_dialog.dart';
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
        child: (noteList.isEmpty)
            ? Center(
                child: Text(
                  'There\'s nothing your note... \n Please add Note..🥺',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),
                ),
              )
            : GridView.builder(
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
                      onTap: () async {
                        await context
                            .read(notePageNotifierProvider.notifier)
                            .fetchNoteForDB(noteList[index].noteId);
                        await context
                            .read(appNotifierProvider.notifier)
                            .push(NotePage(index: index));
                      },
                      onLongPress: () {
                        UpdateBookDialog(
                          controller: bookNameController,
                          selectedNote: noteList[index],
                          selectingImage: () {
                            noteListNotifier.selectedImageFromGallary();
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
              noteListNotifier.selectedImageFromGallary();
            },
            cancelLogic: () {
              noteListNotifier.dispose();
            },
          ).show(context);
        },
      ),
    );
  }
}
