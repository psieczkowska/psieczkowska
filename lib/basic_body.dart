import 'package:flutter/material.dart';
import './animated_image.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BasicBody extends StatelessWidget {
  const BasicBody(
      {Key? key,
      required this.borders,
      required this.square,
      required this.isChangedNumber})
      : super(key: key);
  final BorderSide borders;
  final double square;
  final int isChangedNumber;
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
              height: square / 3,
              decoration: BoxDecoration(
                border: Border(
                  left: borders,
                  top: borders,
                  right: borders,
                ),
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
            ),
            Container(
              width: square / 3,
              height: square / 3,
              decoration: BoxDecoration(
                border: Border(
                  right: borders,
                  top: borders,
                ),
              ),
              child: const Text('Paulina'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                    left: borders,
                    bottom: borders,
                    top: borders,
                  )),
                  width: square / 3,
                  height: square / 3,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: borders,
                      bottom: borders,
                    ),
                  ),
                  width: square / 3,
                  height: square / 3,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                  vertical: borders,
                  horizontal: borders,
                ),
              ),
              width: square * 2 / 3,
              height: square * 2 / 3,
              child: AnimatedImage(
                isChanged: isChangedNumber,
                number: 0,
                firstImage: Image.asset(
                  'assets/images/zdjecie1.jpg',
                  fit: BoxFit.cover,
                ),
                secondImage: Image.asset(
                  'assets/images/zdjecie2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
