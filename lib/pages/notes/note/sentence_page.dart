import 'package:flutter/material.dart';

import 'package:notes_on_english_literature/common/helpers/structured_sentence.dart';
import 'package:notes_on_english_literature/domain/notes/models/sentence.dart';
import 'package:notes_on_english_literature/common/theme.dart';

class SentencePage extends StatelessWidget {
  const SentencePage(this.sentence);

  final Sentence sentence;

  @override
  Widget build(BuildContext context) {
    const testSentence =
        '//[Rapidly build modern websites //(without ever leaving your HTML.)//]//';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('文法メモ', style: Theme.of(context).textTheme.bodyText1),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      sentence.grammerMemo,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[700]),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('対訳', style: Theme.of(context).textTheme.bodyText1),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      sentence.transration,
                      overflow: TextOverflow.clip,
                    ),
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
