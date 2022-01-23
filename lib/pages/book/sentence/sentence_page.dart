import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/common/helpers/structured_sentence.dart';
import 'package:notes_on_english_literature/common/theme.dart';
import 'package:notes_on_english_literature/di_container.dart';
import 'package:notes_on_english_literature/domain/notes/models/note.dart';
import 'package:notes_on_english_literature/domain/notes/models/sentence.dart';
import 'package:notes_on_english_literature/pages/book/note/note_page_provider.dart';
import 'package:notes_on_english_literature/pages/book/note/widgets/update_sentence_page.dart';
import 'package:notes_on_english_literature/pages/book/sentence/widgets/update_sentence_dialog.dart';

class SentencePage extends HookWidget {
  const SentencePage({Key? key, required this.sentenceIndex}) : super(key: key);

  final int sentenceIndex;

  @override
  Widget build(BuildContext context) {
    // TODO: noteごと更新する
    var noteState = const Note();
    var sentence = const Sentence();
    // TODO: Cannot listen to inherited widgets inside HookState.initState. Use HookState.build instead
    // -> useEffect(effect)にてエラーが生じたため、ここでは使用しない

    useState(() {
      noteState = useProvider(notePageNotifierProvider);
      sentence = noteState.sentenceList[sentenceIndex];
    });

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
              // TODO: Dialogで編集するようにする
              UpdateSentenceDialog(
                note: noteState,
                sentence: sentence,
              ).show(context);
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
