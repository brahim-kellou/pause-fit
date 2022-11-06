import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class SkeletonDrawer extends CustomPainter {
  final List<List<Offset>> paths;

  SkeletonDrawer(this.paths);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    Paint paint = Paint();
    paint.strokeWidth = 3;
    paint.color = Colors.green;

    paths.forEach((element) {
      if (element[0].dx != 0 &&
          element[0].dy != 0 &&
          element[1].dx != 0 &&
          element[1].dy != 0) canvas.drawLine(element[0], element[1], paint);
    });

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
