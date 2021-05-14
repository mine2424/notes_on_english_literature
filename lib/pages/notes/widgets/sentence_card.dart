import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/widgets/widgets.dart';

class SentenceCard extends CardBase {
  const SentenceCard();

  @override
  Widget child(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text('sentence'),
            subtitle: Text('memo'),
            onTap: () {},
          ),
          TextButton(
            onPressed: () {},
            child: const Text('open'),
          ),
        ],
      ),
    );
  }
}
