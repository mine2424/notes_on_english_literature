import 'package:flutter/material.dart';

class StructionHighlight {
  StructionHighlight({
    // required this.highlightTextStyles,
    required this.sentence,
    // required this.terms,
    this.textstyle,
  });

  final String sentence;

  // final String terms;

  // final Map<String, TextStyle> highlightTextStyles;
  // final Map<String, dynamic> highlightTextStyles;

  final TextStyle? textstyle;

  var children = <TextSpan>[];
  var textChildren = <String>[];

  final regExpList = ['//[', ']//', '//{', '}//', '//<', '>//', '//(', ')//'];

  final highlightTextStylelist = {
    '//[': {'[': const TextStyle()},
    ']//': {']': const TextStyle()},
    '//{': {'{': const TextStyle()},
    '}//': {'}': const TextStyle()},
    '//<': {'<': const TextStyle()},
    '>//': {'>': const TextStyle()},
    '//(': {'(': const TextStyle()},
    ')//': {')': const TextStyle()},
  };

  // children.add(TextSpan(text: allStringText[i]));

  // 取得した最後の正規表現の最後のindex
  var regIndex = 0;

  void generateTextChildren() {
    print(highlightTextStylelist['//[']!.keys);

    for (var i = 0; i < sentence.length; i++) {
      for (var n = 0; n < regExpList.length; n++) {
        _generateHighlightString(sentence, regExpList[n], i);
      }
    }

    if (regIndex != sentence.length) {
      // 最後の正規表現まで進んだら、最終正規表現の最後のindexから最後までがnormal style
      textChildren.add(sentence.substring(regIndex, sentence.length));
    }

    print(textChildren.join());
  }

  void _generateHighlightString(
    String allStringText,
    String regExp,
    int roopCount,
  ) {
    for (var i = 0; i < regExp.length; i++) {
      if (roopCount + i == allStringText.length) {
        return;
      }

      if (allStringText[roopCount + i] != regExp[i]) {
        return;
      }
    }

    // 正規表現が一回目の時
    if (regIndex == 0) {
      // 0から正規表現の最初のindex分までがnormal styleとなる。
      textChildren.add(allStringText.substring(0, roopCount));

      // 正規表現の最初のindexと+3分までがhighlight styleとなる。
      textChildren.add(allStringText.substring(roopCount, roopCount + 3));

      // 正規表現の最後のindexを代入
      regIndex = roopCount + 3;

      return;
    }

    // 全文の最後に正規表現があった時
    if (roopCount == allStringText.length) {
      return;
    }

    // 正規表現n - 正規表現(n-1)の差 = roopCount - regIndex
    textChildren.add(allStringText.substring(regIndex, roopCount));

    // 正規表現分
    textChildren.add(allStringText.substring(roopCount, roopCount + 3));

    // 正規表現の最後のindexを代入
    regIndex = roopCount + 3;

    return;
  }
}
