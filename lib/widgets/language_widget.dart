import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../models/language.dart';

class LanguageWidget extends StatelessWidget {
  final int isChangedNumber;
  LanguageWidget({Key? key, required this.isChangedNumber}) : super(key: key);

  final List<Language> _languageList = [
    Language('Flutter', 'in love'),
    Language('Java', 'good'),
    Language('Kotlin', 'very good'),
    Language('Assembler', 'basic'),
    Language('JavaScript', 'basic'),
    Language('MySQL', 'good'),
    Language('Matlab', 'basic'),
    Language('HTML', 'basic'),
    Language('CSS', 'basic'),
    Language('SQL', 'basic'),
  ];
// Returns an image which is matched with [language.level].
  String _chooseImage(Language language) {
    if (language.level == 'good') {
      return 'assets/images/good.png';
    } else if (language.level == 'in love') {
      return 'assets/images/heart.png';
    } else if (language.level == 'very good') {
      return 'assets/images/very_good.png';
    } else {
      return 'assets/images/basic.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Random language from list.
    Language language = _languageList[Random().nextInt(_languageList.length)];
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5),
          child: AutoSizeText(
            language.name,
            minFontSize: 15,
            maxFontSize: 30,
            style: TextStyle(
              fontFamily: (isChangedNumber == 0 || isChangedNumber == 1)
                  ? 'OpenSans'
                  : 'Quicksand',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Image.asset(_chooseImage(language), fit: BoxFit.contain),
        )
      ],
    );
  }
}
