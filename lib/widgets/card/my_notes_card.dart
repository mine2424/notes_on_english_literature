import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/widgets/widgets.dart';

class MyNotesCard extends CardBase {
  const MyNotesCard();

  @override
  Widget child(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('よく見る英文(仮)'),
        ),
        ListView.separated(
          itemCount: 3,
          shrinkWrap: true,
          separatorBuilder: (context, index) =>
              Divider(color: Colors.grey[700]),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: const Text(
                  'Calculation based on a root font-size of 16 pixel.',
                ),
                subtitle: Text(
                  '新規でのバグ・警告等がログに表示されていないかの確認',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
