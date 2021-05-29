import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes_on_english_literature/widgets/button/neumorphism_button.dart';
import 'package:notes_on_english_literature/widgets/widgets.dart';

class CreateSentencePage extends HookWidget {
  const CreateSentencePage();

  @override
  Widget build(BuildContext context) {
    final sentenceController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final grammerMemoController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final transrationController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          AccentForm(
            label: 'sentence',
            controller: sentenceController,
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
              text: 'create',
              onTapLogic: () {},
            ).show(context),
          ),
        ],
      ),
    );
  }
}
