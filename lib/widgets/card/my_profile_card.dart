import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/widgets/card/card_base.dart';

class MyProfileCard extends CardBase {
  const MyProfileCard();

  @override
  Widget child(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                'https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
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
