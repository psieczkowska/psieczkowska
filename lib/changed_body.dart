import 'dart:math';
import 'package:flutter/material.dart';
import './widgets/avatar_stack.dart';
import './widgets/bootcamp_text.dart';
import './widgets/facts.dart';
import './widgets/language_widget.dart';
import './widgets/animated_image.dart';

class ChangedBody extends StatelessWidget {
  final double square;
  final int isChangedNumber;
  final List<Color> colorsList;

  const ChangedBody({
    Key? key,
    required this.square,
    required this.isChangedNumber,
    required this.colorsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bordersSpace = 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: square * 2 / 3,
              height: square * 2 / 3,
              child: Card(
                color: colorsList[Random().nextInt(colorsList.length)],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
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
                SizedBox(
                  width: (square - bordersSpace) / 3,
                  height: (square - bordersSpace) / 3,
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: AvatarStack(
                      colorsList: colorsList,
                      square: square,
                      bordersSpace: bordersSpace,
                      isChangedNumber: isChangedNumber,
                    ),
                  ),
                ),
                SizedBox(
                  width: square / 3,
                  height: square / 3,
                  child: Card(
                    color: colorsList[Random().nextInt(colorsList.length)],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    child: Facts(
                      square: square,
                      bordersSpace: bordersSpace,
                      isChangedNumber: isChangedNumber,
                    ),
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
            SizedBox(
              width: square / 3,
              height: square / 3,
              child: Card(
                color: colorsList[Random().nextInt(colorsList.length)],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: LanguageWidget(isChangedNumber: isChangedNumber),
              ),
            ),
            SizedBox(
              width: square * 2 / 3,
              height: square / 3,
              child: Card(
                color: colorsList[Random().nextInt(colorsList.length)],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: BootcampText(isChangedNumber: isChangedNumber),
                elevation: 5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
