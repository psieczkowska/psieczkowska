import 'dart:math';

import 'package:flutter/material.dart';
import './animated_image.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TestBody extends StatelessWidget {
  const TestBody(
      {Key? key,
      required this.bordersSpace,
      required this.borderColor,
      required this.square,
      required this.isChangedNumber,
      required this.colorsList})
      : super(key: key);
  final double bordersSpace;
  final Color borderColor;
  final double square;
  final int isChangedNumber;
  final List<Color> colorsList;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: square,
        height: square,
        child: Card(
          color: borderColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: bordersSpace / 3,
                          vertical: (bordersSpace / 3),
                        ),
                        color: colorsList[Random().nextInt(7)],
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
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(
                          right: bordersSpace / 3,
                          bottom: (bordersSpace / 3),
                          top: (bordersSpace / 3),
                        ),
                        color: colorsList[Random().nextInt(7)],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: (bordersSpace / 3),
                          bottom: (bordersSpace / 3),
                          right: (bordersSpace / 3),
                        ),
                        child: Column(
                          children: [
                            Flexible(
                              child: Container(
                                color: colorsList[Random().nextInt(7)],
                                margin:
                                    EdgeInsets.only(bottom: bordersSpace / 8),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(top: bordersSpace / 8),
                                color: colorsList[Random().nextInt(7)],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: (bordersSpace / 3),
                          right: (bordersSpace / 3),
                        ),
                        color: colorsList[Random().nextInt(7)],
                        child: AnimatedImage(
                          isChanged: isChangedNumber,
                          number: 0,
                          firstImage: Image.asset(
                            'assets/images/zdjecie1.jpg',
                            fit: BoxFit.fitWidth,
                          ),
                          secondImage: Image.asset(
                            'assets/images/zdjecie2.jpg',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
