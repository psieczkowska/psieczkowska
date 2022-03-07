import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AvatarStack extends StatelessWidget {
  final List<Color> colorsList;
  final double square;
  final double bordersSpace;
  final int isChangedNumber;
  const AvatarStack(
      {Key? key,
      required this.colorsList,
      required this.square,
      required this.bordersSpace,
      required this.isChangedNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        foregroundImage: const AssetImage('assets/images/zdjecie3.jpg'),
        radius: (square - bordersSpace) * 2 / 3,
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: ClipRRect(
          child: Container(
            color: colorsList[Random().nextInt(colorsList.length)],
            width: (square - bordersSpace) / 3,
            height: (square - bordersSpace) / 15,
            child: AutoSizeText(
              'Paulina',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: (isChangedNumber == 0 || isChangedNumber == 1)
                    ? 'OpenSans'
                    : 'Quicksand',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
        ),
      )
    ]);
  }
}
