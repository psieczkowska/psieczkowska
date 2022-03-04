import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import './changed_body.dart';
import './test_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paulina Sieczkowska',
      theme: ThemeData(
        colorSchemeSeed: Colors.lightBlue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColorDark),
          ),
        ),
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
                titleSmall: const TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _isChanged = 0;
  List<Color> pinkList = [
    Colors.pink[50]!,
    Colors.pink[100]!,
    Colors.purple[200]!,
    Colors.pink[200]!,
    Colors.purple[50]!,
    Colors.red[50]!,
    Colors.red[100]!,
    Colors.purple[100]!
  ];

  List<Color> blueList = [
    Colors.blue[50]!,
    Colors.blue[100]!,
    Colors.blue[200]!,
    Colors.indigo[50]!,
    Colors.indigo[100]!,
    Colors.indigo[200]!,
    Colors.deepPurple[50]!,
    Colors.purple[50]!,
  ];

  PreferredSizeWidget _buildCupertinoNavBar() {
    return CupertinoNavigationBar(
      middle: const Text(
        'Paulina Sieczkowska',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _changeUi,
            child: const Icon(CupertinoIcons.wand_stars),
          )
        ],
      ),
    );
  }

  // Widget animatedImage(
  //     int _isChanged, int number, Image firstImage, Image secondImage) {
  //   return AnimatedCrossFade(
  //     duration: const Duration(seconds: 1),
  //     firstChild: firstImage,
  //     secondChild: secondImage,
  //     crossFadeState: _isChanged == number
  //         ? CrossFadeState.showFirst
  //         : CrossFadeState.showSecond,
  //   );
  // }

  // Widget _buildBasicBody(BorderSide borders, double square) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       Row(
  //         children: [
  //           Container(
  //             width: square * 2 / 3,
  //             height: square / 3,
  //             decoration: BoxDecoration(
  //               border: Border(
  //                 left: borders,
  //                 top: borders,
  //                 right: borders,
  //               ),
  //             ),
  //             child: Container(
  //               padding: EdgeInsets.all(5),
  //               alignment: Alignment.center,
  //               child: Text(
  //                 'Od Bootcampu oczekuję pozytywnej atmosfery, możliwości rozwoju, dużej dawki nowej wiedzy.',
  //                 textAlign: TextAlign.justify,
  //                 overflow: TextOverflow.fade,
  //                 softWrap: true,
  //                 style: TextStyle(fontSize: 20),
  //               ),
  //             ),
  //           ),
  //           Container(
  //             width: square / 3,
  //             height: square / 3,
  //             decoration: BoxDecoration(
  //               border: Border(
  //                 right: borders,
  //                 top: borders,
  //               ),
  //             ),
  //             child: const Text('Paulina'),
  //           ),
  //         ],
  //       ),
  //       Row(
  //         children: [
  //           Column(
  //             children: [
  //               Container(
  //                 decoration: BoxDecoration(
  //                   border: Border(
  //                     left: borders,
  //                     bottom: borders,
  //                     top: borders,
  //                   ),
  //                 ),
  //                 width: square / 3,
  //                 height: square / 3,
  //               ),
  //               Container(
  //                 decoration: BoxDecoration(
  //                   border: Border(
  //                     left: borders,
  //                     bottom: borders,
  //                   ),
  //                 ),
  //                 width: square / 3,
  //                 height: square / 3,
  //               ),
  //             ],
  //           ),
  //           Container(
  //             decoration: BoxDecoration(
  //               border: Border.symmetric(
  //                 vertical: borders,
  //                 horizontal: borders,
  //               ),
  //             ),
  //             width: square * 2 / 3,
  //             height: square * 2 / 3,
  //             child: animatedImage(
  //               _isChanged,
  //               0,
  //               Image.asset(
  //                 'assets/images/zdjecie1.jpg',
  //                 fit: BoxFit.fitWidth,
  //               ),
  //               Image.asset(
  //                 'assets/images/zdjecie2.jpg',
  //                 fit: BoxFit.fitWidth,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildChangedBody(double square) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Row(
  //         children: [
  //           Container(
  //             width: square * 2 / 3,
  //             height: square * 2 / 3,
  //             child: Card(
  //               child: AnimatedImage(
  //               _isChanged,
  //               2,
  //               Image.asset(
  //                 'assets/images/zdjecie2.jpg',
  //                 fit: BoxFit.fitWidth,
  //               ),
  //               Image.asset(
  //                 'assets/images/zdjecie1.jpg',
  //                 fit: BoxFit.fitWidth,
  //               ),
  //             ),
  //               elevation: 5,
  //             ),
  //           ),
  //           Column(
  //             children: [
  //               Container(
  //                 width: square / 3,
  //                 height: square / 3,
  //                 child: Card(
  //                   elevation: 5,
  //                 ),
  //               ),
  //               Container(
  //                 width: square / 3,
  //                 height: square / 3,
  //                 child: Card(
  //                   elevation: 5,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //       Row(
  //         children: [
  //           Container(
  //             width: square / 3,
  //             height: square / 3,
  //             child: Card(
  //               elevation: 5,
  //             ),
  //           ),
  //           Container(
  //             width: square * 2 / 3,
  //             height: square / 3,
  //             child: Card(
  //               child: const Text('Paulina'),
  //               elevation: 5,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        'Paulina Sieczkowska',
      ),
      actions: [
        IconButton(
          onPressed: _changeUi,
          icon: const Icon(Icons.change_circle_outlined),
        )
      ],
    );
  }

  void _changeUi() {
    setState(() {
      if (_isChanged == 0) {
        _isChanged = 1;
      } else if (_isChanged == 1) {
        _isChanged = 2;
      } else if (_isChanged == 2) {
        _isChanged = 3;
      } else {
        _isChanged = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final PreferredSizeWidget appBar =
        (!kIsWeb && Platform.isIOS) ? _buildCupertinoNavBar() : _buildAppBar();
    double squareWidth = mediaQuery.size.width;
    if (isLandscape) {
      squareWidth = mediaQuery.size.height -
          appBar.preferredSize.height -
          mediaQuery.padding.top;
    }

    Widget pageBody = TestBody(
      borderColor: Colors.pink,
      bordersSpace: squareWidth / 10,
      square: squareWidth,
      isChangedNumber: _isChanged,
      colorsList: pinkList,
    );
    if (_isChanged == 1 ) {
      pageBody = ChangedBody(
        square: squareWidth,
        isChangedNumber: _isChanged,
        colorsList: pinkList,
      );
    }

    if (_isChanged == 2) {
            pageBody = ChangedBody(
        square: squareWidth,
        isChangedNumber: _isChanged,
        colorsList: blueList,
      );
    }

    if (_isChanged == 3) {
      pageBody = TestBody(
        borderColor: Colors.indigo,
        bordersSpace: squareWidth / 20,
        square: squareWidth,
        isChangedNumber: _isChanged,
        colorsList: blueList,
      );
    }

    return (!kIsWeb && Platform.isIOS)
        ? GestureDetector(
            onTap: _changeUi,
            child: CupertinoPageScaffold(
              child: pageBody,
              navigationBar: appBar as ObstructingPreferredSizeWidget,
            ),
          )
        : GestureDetector(
            onTap: _changeUi,
            child: Scaffold(
              appBar: appBar,
              body: pageBody,
            ));
  }
}
