import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/pages/notes/widgets/struction_card.dart';

class SentencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const StructionCard().show(context),
        ],
      ),
    );
  }
}
