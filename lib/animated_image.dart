import 'package:flutter/material.dart';

class AnimatedImage extends StatelessWidget {
  final int isChanged;
  final Image firstImage;
  final Image secondImage;
  final int number;
  const AnimatedImage(
      {Key? key,
      required this.isChanged,
      required this.firstImage,
      required this.secondImage,
      required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 1),
      firstChild: firstImage,
      secondChild: secondImage,
      crossFadeState: isChanged == number
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
