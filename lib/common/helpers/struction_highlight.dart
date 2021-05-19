import 'package:flutter/material.dart';

class StructuredSentence extends StatelessWidget {
  StructuredSentence({
    required this.highlightTextStyles,
    required this.sentence,
    this.normalTextstyle,
    this.overflow = TextOverflow.clip,
  });

  final String sentence;

  final TextOverflow overflow;

  final TextStyle? normalTextstyle;

  final Map<String, Map<String, TextStyle>> highlightTextStyles;

  final children = <TextSpan>[];

  @override
  Widget build(BuildContext context) {
    // 取得した最後の正規表現の最後のindex
    var regIndex = 0;

    bool isRegExpWord(int roopCount, String regExp, String allStringText) {
      for (var i = 0; i < regExp.length; i++) {
        if (roopCount + i == allStringText.length) {
          return false;
        }

        if (allStringText[roopCount + i] != regExp[i]) {
          return false;
        }
      }

      return true;
    }

    void _addHighlightTextStyle(String regExp) {
      children.add(TextSpan(
        text: highlightTextStyles[regExp]!.keys.first,
        style: highlightTextStyles[regExp]!.values.first,
      ));
    }

    void _addNormalTextStyle(String text) {
      children.add(
        TextSpan(
          text: text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 20,
                letterSpacing: 1.5,
              ),
        ),
      );
    }

    void _generateHighlightString(
      String allStringText,
      String regExp,
      int roopCount,
    ) {
      // 正規表現が含まれているかどうか
      if (!isRegExpWord(roopCount, regExp, allStringText)) {
        return;
      }

      // 正規表現が一回目の時
      if (regIndex == 0) {
        // 0から正規表現の最初のindex分までがnormal styleとなる。
        _addNormalTextStyle(allStringText.substring(0, roopCount));

        // 正規表現の最初のindexと+3分までがhighlight styleとなる。
        _addHighlightTextStyle(
          allStringText.substring(roopCount, roopCount + 3),
        );

        // 正規表現の最後のindexを代入
        regIndex = roopCount + 3;

        return;
      }

      // 全文の最後に正規表現があった時
      if (roopCount == allStringText.length) {
        return;
      }

      // 正規表現n - 正規表現(n-1)の差 = roopCount - regIndex
      _addNormalTextStyle(allStringText.substring(regIndex, roopCount));

      // 正規表現分
      _addHighlightTextStyle(allStringText.substring(roopCount, roopCount + 3));

      regIndex = roopCount + 3;

      return;
    }

    // 英文の構造が示された文章を生成
    for (var i = 0; i < sentence.length; i++) {
      for (final regExp in highlightTextStyles.keys) {
        _generateHighlightString(sentence, regExp, i);
      }
    }

    if (regIndex != sentence.length) {
      // 最後の正規表現まで進んだら、最終正規表現の最後のindexから最後までがnormal style
      _addNormalTextStyle(sentence.substring(regIndex, sentence.length));
    }

    return RichText(
      overflow: overflow,
      text: TextSpan(children: children),
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
    );
  }
}
