import 'package:flutter/material.dart';
import 'package:shareboard/artist.dart';

class FreeLine extends Artist {
  List<Offset> path;
  Color color;
  double strokeWidth;
  StrokeCap strokeCap;

  FreeLine(this.path, this.color, this.strokeWidth, this.strokeCap);
}
