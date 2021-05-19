import 'package:flutter/material.dart';

import 'package:notes_on_english_literature/pages/notes/widgets/struction_card.dart';

class SentencePage extends StatelessWidget {
  const SentencePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: const StructionCard().show(context),
            ),
            Divider(color: Colors.grey[700]),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '文法メモ',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'タワーレコードが3月21日（日）に満を持して発売するコンピレーションCD『CITY POP Voyage-STANDARD BEST』のテーマは“時を超えて、国を超えて、いま世界を魅了するジャパニーズ・シティ・ポップ”。いま海外で人気沸騰中の「真夜中のドア」や、シティ・ポップ・ブームの火付け役となった「プラスティック・ラヴ」などの定番曲を新旧アーティストによるカバーで収録している。さらに、YouTube動画再生数250万回以上と世界規模でリバイバルヒットさせたインドネシアのカバーモンスターRainych（レイニッチ）「真夜中のドア / STAY WITH ME」を世界初CD化。カバー・アートは、大滝詠一『A LONG VACATION』のジャケットでおなじみの永井博のイラストを使用している',
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[700]),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TODO: なんか、各行に線入れたい
                  Text(
                    '対訳',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'タワーレコードが3月21日（日）に満を持して発売するコンピレーションCD『CITY POP Voyage-STANDARD BEST』のテーマは“時を超えて、国を超えて、いま世界を魅了するジャパニーズ・シティ・ポップ”。いま海外で人気沸騰中の「真夜中のドア」や、シティ・ポップ・ブームの火付け役となった「プラスティック・ラヴ」などの定番曲を新旧アーティストによるカバーで収録している。さらに、YouTube動画再生数250万回以上と世界規模でリバイバルヒットさせたインドネシアのカバーモンスターRainych（レイニッチ）「真夜中のドア / STAY WITH ME」を世界初CD化。カバー・アートは、大滝詠一『A LONG VACATION』のジャケットでおなじみの永井博のイラストを使用している',
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
