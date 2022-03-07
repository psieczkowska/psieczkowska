import 'dart:math';
import 'package:flutter/material.dart';
import './widgets/avatar_stack.dart';
import './widgets/bootcamp_text.dart';
import './widgets/facts.dart';
import './widgets/language_widget.dart';
import './widgets/animated_image.dart';

class BasicBody extends StatelessWidget {
  final double bordersSpace;
  final Color borderColor;
  final double square;
  final int isChangedNumber;
  final List<Color> colorsList;

  const BasicBody({
    Key? key,
    required this.bordersSpace,
    required this.borderColor,
    required this.square,
    required this.isChangedNumber,
    required this.colorsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: square + bordersSpace,
        height: square + bordersSpace,
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
                        margin: EdgeInsets.only(
                          top: bordersSpace / 4,
                          left: bordersSpace / 4,
                          bottom: bordersSpace / 8,
                          right: bordersSpace / 8,
                        ),
                        color: colorsList[Random().nextInt(colorsList.length)],
                        child: BootcampText(isChangedNumber: isChangedNumber),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(
                            right: bordersSpace / 4,
                            bottom: (bordersSpace / 8),
                            left: (bordersSpace / 8),
                            top: (bordersSpace / 4),
                          ),
                          child: AvatarStack(
                            colorsList: colorsList,
                            square: square,
                            bordersSpace: bordersSpace,
                            isChangedNumber: isChangedNumber,
                          )),
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
                      child: Column(
                        children: [
                          Flexible(
                            child: Container(
                                margin: EdgeInsets.only(
                                  bottom: bordersSpace / 8,
                                  left: bordersSpace / 4,
                                  top: bordersSpace / 8,
                                  right: bordersSpace / 8,
                                ),
                                color: colorsList[
                                    Random().nextInt(colorsList.length)],
                                child: LanguageWidget(
                                  isChangedNumber: isChangedNumber,
                                )),
                          ),
                          Flexible(
                            child: Container(
                                color: colorsList[
                                    Random().nextInt(colorsList.length)],
                                margin: EdgeInsets.only(
                                  bottom: bordersSpace / 4,
                                  left: bordersSpace / 4,
                                  top: bordersSpace / 8,
                                  right: bordersSpace / 8,
                                ),
                                child: Facts(
                                  square: square,
                                  bordersSpace: bordersSpace,
                                  isChangedNumber: isChangedNumber,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: (bordersSpace / 4),
                          right: (bordersSpace / 4),
                          left: (bordersSpace / 8),
                          top: (bordersSpace / 8),
                        ),
                        color:
                            colorsList[Random().nextInt(colorsList.length - 1)],
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
