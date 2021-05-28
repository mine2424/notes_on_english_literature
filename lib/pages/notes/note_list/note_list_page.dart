import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/pages/notes/note_list/note_list_provider.dart';

import 'package:notes_on_english_literature/pages/notes/widgets/note_card.dart';
import 'package:notes_on_english_literature/pages/notes/widgets/note_dialog.dart';
import 'package:notes_on_english_literature/widgets/button/floating_custom_button.dart';

class NoteListPage extends HookWidget {
  const NoteListPage();

  @override
  Widget build(BuildContext context) {
    final list = [
      'https://cdn-ak.f.st-hatena.com/images/fotolife/k/kidsmoo1221/20190511/20190511234947.jpg',
      'https://sams-up.com/wp-content/uploads/2018/10/No-Rome%EF%BC%8FRIP-Indo-HisashiA-sha-.jpg',
      'https://diy-magazine.s3.amazonaws.com/d/diy/Artists/N/No-Rome/DIY-82/No-Rome-by-Jenn-Five-DIY-mag-NOROME_0730_JF.jpg',
      'https://www.universal-music.co.jp/the1975/wp-content/uploads/sites/1115/2016/08/The-1975-official-photo-2020.jpg',
      'https://66.media.tumblr.com/18f3a10f6cd8cb849138f77d8a3f09a1/tumblr_inline_ptzcmmfz8B1s9on4d_540.jpg',
      'https://i1.sndcdn.com/avatars-000697876198-3vxyjp-t500x500.jpg',
      'https://www.nme.com/wp-content/uploads/2019/03/WYBCM-Easy-Life.jpg',
      'https://sakuratapsmusic.info/wp-content/uploads/2018/07/a2312137774_10.jpg',
      'https://diy-magazine.s3.amazonaws.com/d/diy/Artists/G/Girl-In-red/Girl-in-Red_-by-Chris-Almeida-1.png',
    ];

    final noteListNotifier = context.read(noteListNotifierProvider.notifier);

    useEffect(() {
      noteListNotifier.fetchNoteListForLocalDB();
      return;
    }, const []);

    final bookNameController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 8,
          ),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: BookCard(
                image: list[index],
                onLongPress: () {
                  // TODO: update or delete dialog
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingCustomButton(
        iconData: Icons.add,
        label: 'Add Note',
        onPressed: () {
          BookDialog(
            controller: bookNameController,
            selectingImage: () {
              context
                  .read(noteListNotifierProvider.notifier)
                  .selectedImageFromGallary();
            },
          ).show(context);
        },
      ),
    );
  }
}
