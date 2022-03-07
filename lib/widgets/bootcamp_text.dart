import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BootcampText extends StatelessWidget {
  final int isChangedNumber;

  const BootcampText({Key? key, required this.isChangedNumber})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      child: AutoSizeText(
        'Od Bootcampu oczekuję pozytywnej atmosfery, możliwości rozwoju, dużej dawki nowej wiedzy.',
        minFontSize: 5,
        maxFontSize: 30,
        style: TextStyle(
            fontFamily: (isChangedNumber == 0 || isChangedNumber == 1) ? 'OpenSans' : 'Quicksand',
            ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
