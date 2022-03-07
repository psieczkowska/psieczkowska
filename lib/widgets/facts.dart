import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Facts extends StatelessWidget {
  final double square;
  final double bordersSpace;
  final int isChangedNumber;
  const Facts(
      {Key? key,
      required this.square,
      required this.bordersSpace,
      required this.isChangedNumber})
      : super(key: key);

  static const List<String> _factsList = [
    'Jeżdżę na monocyklu.',
    'Kiedyś marzyłam o pracy w cyrku (i byłam tego bliska).',
    'Uwielbiam podróżować.',
    'Kocham jeść, wszystko.',
    'Od wielu lat pracuję z dziećmi, przynosi mi to mnóstwo satysfakcji.',
    'Wrocław, Hiszpania i Tatry to moje ulubione miejsca na świecie.',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: square - bordersSpace / 3,
      height: square - bordersSpace / 3,
      alignment: Alignment.center,
      child: AutoSizeText(
        _factsList[Random().nextInt(_factsList.length)].toString(),
        style: TextStyle(
          fontFamily: (isChangedNumber == 0 || isChangedNumber == 1)
              ? 'OpenSans'
              : 'Quicksand',
        ),
        textAlign: TextAlign.center,
        minFontSize: 5,
        maxFontSize: 30,
      ),
    );
  }
}
