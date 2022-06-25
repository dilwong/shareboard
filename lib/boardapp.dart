import 'package:flutter/material.dart';
import 'package:shareboard/drawpage.dart';

class BoardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShareBoard',
      home: DrawPage(),
    );
  }
}
