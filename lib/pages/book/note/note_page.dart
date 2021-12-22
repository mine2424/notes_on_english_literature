import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/di_container.dart';
import 'package:notes_on_english_literature/pages/book/note/note_page_provider.dart';
import 'package:notes_on_english_literature/pages/book/note/widgets/create_sentence_page.dart';
import 'package:notes_on_english_literature/pages/book/sentence/sentence_page.dart';
import 'package:notes_on_english_literature/widgets/button/floating_custom_button.dart';
import 'package:notes_on_english_literature/widgets/button/info_button.dart';
import 'package:notes_on_english_literature/widgets/dialog/comfirm_dialog.dart';

class NotePage extends HookWidget {
  const NotePage({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final noteState = useProvider(notePageNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [InfoButton(onPressed: () {})],
      ),
      body: ListView.separated(
        itemCount: noteState.sentenceList.length,
        separatorBuilder: (context, index) => Divider(color: Colors.grey[700]),
        itemBuilder: (context, index) {
          // TODO(mine): noteとsentence型の両方をlistに入れれるようにする。
          final sentence = noteState.sentenceList[index];

          return GestureDetector(
            onTap: () async {
              // TODO(mine): bookとsentenceの場合で条件分岐させる
              await context
                  .read(appNotifierProvider.notifier)
                  .push(SentencePage(sentenceIndex: index));
            },
            onLongPress: () async {
              // TODO(mine): bookとsentenceの場合で条件分岐させる
              ConfirmDialog(
                title: '削除',
                confirmText: 'はい',
                message: '本当にこの文章を削除しますか？',
                onTapLogic: () async {
                  await context
                      .read(notePageNotifierProvider.notifier)
                      .deleteSentenceForDB(noteState, sentence);
                },
              ).show(context);
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
        label: 'Add Sentence or Note',
        onPressed: () async {
          await context
              .read(appNotifierProvider.notifier)
              .push(CreateSentencePage(noteState), true);
        },
      ),
    );
  }
}
