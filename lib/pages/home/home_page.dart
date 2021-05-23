import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:notes_on_english_literature/widgets/widgets.dart';

class HomePage extends HookWidget {
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
