import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import './animated_image.dart';

class ChangedBody extends StatelessWidget {
  final double square;
  final int isChangedNumber;
  final List<Color> colorsList;
  const ChangedBody(
      {Key? key,
      required this.square,
      required this.isChangedNumber,
      required this.colorsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: square * 2 / 3,
              height: square * 2 / 3,
              child: Card(
                color: colorsList[Random().nextInt(7)],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: AnimatedImage(
                    isChanged: isChangedNumber,
                    number: 2,
                    firstImage: Image.asset(
                      'assets/images/zdjecie2.jpg',
                      fit: BoxFit.cover,
                    ),
                    secondImage: Image.asset(
                      'assets/images/zdjecie1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                elevation: 5,
              ),
            ),
            Column(
              children: [
                Container(
                  width: square / 3,
                  height: square / 3,
                  child: Card(
                    color: colorsList[Random().nextInt(7)],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                ),
                Container(
                  width: square / 3,
                  height: square / 3,
                  child: Card(
                    color: colorsList[Random().nextInt(7)],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: square / 3,
              height: square / 3,
              child: Card(
                color: colorsList[Random().nextInt(7)],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
            ),
            Container(
              width: square * 2 / 3,
              height: square / 3,
              child: Card(
                color: colorsList[Random().nextInt(7)],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    'Od Bootcampu oczekuję pozytywnej atmosfery, możliwości rozwoju, dużej dawki nowej wiedzy.',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
