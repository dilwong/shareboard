import 'package:flutter/material.dart';
import 'package:shareboard/freeline.dart';
import 'package:shareboard/linepainter.dart';

class DrawPage extends StatefulWidget {
  @override
  DrawPageState createState() => DrawPageState();
}

class DrawPageState extends State<DrawPage> {

  List<FreeLine> lines = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildFreeLines(context)
    );
  }

  Widget buildFreeLines(BuildContext context) {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topLeft,
          color: Colors.transparent,
          child: CustomPaint(
            painter: LinePainter(lines)
          )
        )
      )
    );
  }

  void onPanStart(DragStartDetails details) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset firstPoint = box.globalToLocal(details.globalPosition);
    setState(() {
      lines.add(
        FreeLine([firstPoint], Colors.black, 2.0, StrokeCap.round)
      );
    });
  }

  void onPanUpdate(DragUpdateDetails details) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset newPoint = box.globalToLocal(details.globalPosition);
    //print(newPoint);
    setState(() {
      lines[lines.length - 1].path.add(newPoint);
    });
  }

  void onPanEnd(DragEndDetails details) {
  }

}