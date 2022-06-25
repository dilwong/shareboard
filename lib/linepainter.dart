import 'package:flutter/material.dart';
import 'package:shareboard/freeline.dart';

class LinePainter extends CustomPainter {
  
  List<FreeLine> lines = [];

  LinePainter(this.lines);

  @override
  void paint(Canvas canvas, Size size) {
    
    Paint paint = Paint();

    for (int i = 0; i < lines.length; ++i) {
      for (int j = 0; j < lines[i].path.length - 1; ++ j) {
        paint
          ..color = lines[i].color
          ..strokeWidth = lines[i].strokeWidth
          ..strokeCap = lines[i].strokeCap;
        canvas.drawLine(lines[i].path[j], lines[i].path[j + 1], paint);
      }
    }

  }

  @override
  bool shouldRepaint(LinePainter delegate) {
    return true;
  }
}