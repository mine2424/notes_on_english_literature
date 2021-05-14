import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MyProfileCard().show(context),
          const MyNotesCard().show(context)
        ],
      ),
    );
  }
}
