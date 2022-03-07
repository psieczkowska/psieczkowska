import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import './changed_body.dart';
import './basic_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paulina Sieczkowska',
      home: const MyHomePage(),
      theme: ThemeData(
        canvasColor: const Color.fromARGB(255, 249, 241, 255),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // The number depends on the user's clicks.
  int _isChanged = 0;

  // List of colors in pink shade, which is made for background of content.
  final List<Color> _pinkList = [
    Colors.pink[50]!,
    Colors.pink[100]!,
    Colors.purple[200]!,
    Colors.pink[200]!,
    Colors.purple[50]!,
    Colors.red[50]!,
    Colors.red[100]!,
    Colors.purple[100]!
  ];
  // List of colors in pink shade, which is made for background of content.
  final List<Color> _blueList = [
    Colors.blue[50]!,
    Colors.blue[100]!,
    Colors.blue[200]!,
    Colors.indigo[50]!,
    Colors.indigo[100]!,
    Colors.indigo[200]!,
    Colors.deepPurple[50]!,
    Colors.purple[50]!,
  ];

  // The appBar for iOS devices.
  PreferredSizeWidget _buildCupertinoNavBar(Color color) {
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
      backgroundColor: color,
    );
  }

  // The appBar for android devices.
  PreferredSizeWidget _buildAppBar(Color color) {
    return AppBar(
      title: const Text(
        'Paulina Sieczkowska',
      ),
      backgroundColor: color,
      actions: [
        IconButton(
          onPressed: _changeUi,
          icon: const Icon(Icons.change_circle_outlined),
        )
      ],
    );
  }

  // Changes [_isChanged].
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
    // True, if device is in landscape mode.
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    // The color used for appBar background and borders of table.
    Color color = Colors.pink;
    PreferredSizeWidget appBar = (!kIsWeb && Platform.isIOS)
        ? _buildCupertinoNavBar(color)
        : _buildAppBar(color);
    // Number defining the side of the square.
    double squareWidth = mediaQuery.size.width;
    if (isLandscape) {
      squareWidth = mediaQuery.size.height -
          appBar.preferredSize.height -
          mediaQuery.padding.top;
    }

    Widget pageBody = BasicBody(
      borderColor: Colors.pink,
      bordersSpace: squareWidth / 10,
      square: squareWidth - (squareWidth / 10),
      isChangedNumber: _isChanged,
      colorsList: _pinkList,
    );
    //changes the screen content according to the user's presses.
    switch (_isChanged) {
      case 1:
        color = Colors.pink;
        pageBody = ChangedBody(
          square: squareWidth,
          isChangedNumber: _isChanged,
          colorsList: _pinkList,
        );
        break;
      case 2:
        color = Colors.indigo;
        pageBody = ChangedBody(
          square: squareWidth,
          isChangedNumber: _isChanged,
          colorsList: _blueList,
        );
        break;
      case 3:
        color = Colors.indigo;
        pageBody = BasicBody(
          borderColor: Colors.indigo,
          bordersSpace: squareWidth / 20,
          square: squareWidth - (squareWidth / 20),
          isChangedNumber: _isChanged,
          colorsList: _blueList,
        );
        break;
    }

    appBar = (!kIsWeb && Platform.isIOS)
        ? _buildCupertinoNavBar(color)
        : _buildAppBar(color);

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
            ),
          );
  }
}
