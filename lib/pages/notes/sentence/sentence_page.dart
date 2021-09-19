import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/common/helpers/structured_sentence.dart';
import 'package:notes_on_english_literature/di_container.dart';
import 'package:notes_on_english_literature/common/theme.dart';
import 'package:notes_on_english_literature/pages/notes/note/note_page_provider.dart';
import 'package:notes_on_english_literature/pages/notes/note/widgets/update_sentence_page.dart';

class SentencePage extends HookWidget {
  const SentencePage({required this.sentenceIndex});

  final int sentenceIndex;

  @override
  Widget build(BuildContext context) {
    final noteState = useProvider(notePageNotifierProvider);
    final sentence = noteState.sentenceList[sentenceIndex];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              await context
                  .read(appNotifierProvider.notifier)
                  .push(UpdateSentencePage(noteState, sentence), true);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StructuredSentence(
                    isHighlight: true,
                    highlightTextStyles: AppTheme.highlightTextStyles(context),
                    sentence: sentence.structedSentence,
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey[700]),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('文法メモ', style: Theme.of(context).textTheme.bodyText1),
                  Text(
                    sentence.grammerMemo,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[700]),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('対訳', style: Theme.of(context).textTheme.bodyText1),
                  Text(
                    sentence.transration,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
