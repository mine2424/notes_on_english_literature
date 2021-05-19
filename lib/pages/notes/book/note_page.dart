import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/pages/notes/widgets/sentence_card.dart';

class NotePage extends StatelessWidget {
  const NotePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return const SentenceCard().show(context);
        },
      ),
    );
  }
}
