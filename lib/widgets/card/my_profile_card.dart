import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/widgets/card/card_base.dart';

class MyProfileCard extends CardBase {
  const MyProfileCard();

  @override
  Widget child(BuildContext context) {
    return Column(
      children: [
        Row(
          children:const [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                'https://flutter.dev/assets/dash/Dashatars-389042bdc0682644666ce0c179964cebeb9f79483330c7ea61543757e10954cc.png',
              ),
            ),
            SizedBox(width: 16),
            Text('Hi, Ryota! \nthis is your dashboard!'),
          ],
        ),
      ],
    );
  }
}
