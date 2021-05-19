import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/common/helpers/struction_highlight.dart';
import 'package:notes_on_english_literature/widgets/widgets.dart';

class StructionCard extends CardBase {
  const StructionCard({this.sentence});

  final String? sentence;

  @override
  Widget child(BuildContext context) {
    const sentence =
        '//[Rapidly build modern websites //(without ever leaving your HTML.)//]//';

    final highlightTextStyles = {
      '//[': {
        '[': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.yellow[400],
              fontWeight: FontWeight.w700,
            )
      },
      ']//': {
        ']': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.yellow[400],
              fontWeight: FontWeight.w700,
            )
      },
      '//{': {
        '{': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.w700,
            )
      },
      '}//': {
        '}': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.w700,
            )
      },
      '//<': {
        '<': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.green[400],
              fontWeight: FontWeight.w700,
            )
      },
      '>//': {
        '>': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.green[400],
              fontWeight: FontWeight.w700,
            )
      },
      '//(': {
        '(': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.blue[400],
              fontWeight: FontWeight.w700,
            )
      },
      ')//': {
        ')': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.blue[400],
              fontWeight: FontWeight.w700,
            )
      },
    };

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StructuredSentence(
          highlightTextStyles: highlightTextStyles,
          sentence: sentence,
        ),
      ),
    );
  }
}
