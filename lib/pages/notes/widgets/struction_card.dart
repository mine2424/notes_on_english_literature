import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/widgets/widgets.dart';

class StructionCard extends CardBase {
  const StructionCard();

  @override
  Widget child(BuildContext context) {
    return const Center(
      child: Text(
        'Rapidly build modern websites without ever leaving your HTML.',
      ),
    );
  }
}
