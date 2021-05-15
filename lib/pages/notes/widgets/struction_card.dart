import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/common/helpers/struction_highlight.dart';
import 'package:notes_on_english_literature/widgets/widgets.dart';

class StructionCard extends CardBase {
  const StructionCard({this.sentence});

  final String? sentence;

  @override
  Widget child(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StructuredSentence(
          sentence:
              '//[Rapidly build modern websites //(without ever leaving your HTML.)//]//',
        ),
      ),
    );
  }
}
