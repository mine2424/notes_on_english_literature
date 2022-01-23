import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/common/helpers/structured_sentence.dart';
import 'package:notes_on_english_literature/common/theme.dart';
import 'package:notes_on_english_literature/di_container.dart';
import 'package:notes_on_english_literature/domain/notes/models/note.dart';
import 'package:notes_on_english_literature/domain/notes/models/sentence.dart';
import 'package:notes_on_english_literature/pages/app/set_notifier.dart';
import 'package:notes_on_english_literature/pages/book/note/note_page_provider.dart';
import 'package:notes_on_english_literature/widgets/button/neumorphism_button.dart';
import 'package:notes_on_english_literature/widgets/widgets.dart';

class UpdateSentencePage extends HookWidget {
  const UpdateSentencePage(this.note, this.sentence);

  final Note note;
  final Sentence sentence;

  @override
  Widget build(BuildContext context) {
    final onChangedText = useProvider(setNotifier);

    final sentenceController =
        useTextEditingController(text: sentence.structedSentence);

    final grammerMemoController =
        useTextEditingController(text: sentence.grammerMemo);

    final transrationController =
        useTextEditingController(text: sentence.transration);

    final naturalSentence = StructuredSentence(
      isHighlight: false,
      highlightTextStyles: AppTheme.highlightTextStyles(context),
      sentence: (onChangedText.isEmpty || onChangedText == 'Hello World')
          ? sentence.naturalSentence
          : onChangedText,
    ).generateNormalSentence(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Sentence'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StructuredSentence(
                  isHighlight: true,
                  highlightTextStyles: AppTheme.highlightTextStyles(context),
                  sentence: onChangedText,
                ),
              ),
            ),
          ),
          AccentForm(
            label: 'sentence',
            controller: sentenceController,
            onChanged: (value) {
              return context.read(setNotifier.notifier).change(value);
            },
            textLines: 4,
          ),
          AccentForm(
            label: 'grammer memo',
            controller: grammerMemoController,
            textLines: 2,
          ),
          AccentForm(
            label: 'transration',
            controller: transrationController,
            textLines: 2,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: NeumorphismButton(
              text: 'update',
              onTapLogic: () async {
                final user = context.read(userNotifierProvider).user;
                final newSentence = Sentence(
                  sentenceId: sentence.sentenceId,
                  naturalSentence: naturalSentence,
                  structedSentence: sentenceController.text,
                  transration: transrationController.text,
                  grammerMemo: grammerMemoController.text,
                  watchCount: 0,
                  author: user,
                );

                await context
                    .read(notePageNotifierProvider.notifier)
                    .updateSentenceForDB(note, newSentence);

                Navigator.pop(context);
              },
            ).show(context),
          ),
        ],
      ),
    );
  }
}
