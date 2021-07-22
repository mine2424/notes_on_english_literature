import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/di_container.dart';
import 'package:notes_on_english_literature/domain/notes/models/note.dart';
import 'package:notes_on_english_literature/pages/notes/note/create_sentence_page.dart';
import 'package:notes_on_english_literature/pages/notes/note/sentence_page.dart';
import 'package:notes_on_english_literature/widgets/button/floating_custom_button.dart';
import 'package:notes_on_english_literature/widgets/button/info_button.dart';

class NotePage extends StatelessWidget {
  const NotePage(this.note);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [InfoButton(onPressed: () {})],
      ),
      body: ListView.builder(
        itemCount: note.sentenceList.length,
        itemBuilder: (context, index) {
          final sentence = note.sentenceList[index];

          return GestureDetector(
            onTap: () {
              context
                  .read(appNotifierProvider.notifier)
                  .push(SentencePage(sentence));
            },
            child: ListTile(
              title: Text(sentence.naturalSentence),
              subtitle: Text(sentence.transration),
            ),
          );
        },
      ),
      floatingActionButton: FloatingCustomButton(
        iconData: Icons.add,
        label: 'Add Sentence',
        onPressed: () {
          context
              .read(appNotifierProvider.notifier)
              .push(CreateSentencePage(note), true);
        },
      ),
    );
  }
}