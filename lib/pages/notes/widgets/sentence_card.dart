import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/pages/notes/book/sentence_page.dart';
import 'package:notes_on_english_literature/widgets/widgets.dart';

class SentenceCard extends CardBase {
  const SentenceCard();

  @override
  Widget child(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push<void>(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => const SentencePage(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const ListTile(
            title: Text('sentence'),
            subtitle: Text('memo'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => const SentencePage(),
                ),
              );
            },
            child: const Text('open'),
          ),
        ],
      ),
    );
  }
}
