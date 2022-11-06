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

    // canvas.drawLine(Offset(435.2, 392.4), Offset(490.1, 923.2), paint);
    // canvas.drawLine(Offset(490.1, 923.2), Offset(826.3, 890.7), paint);
    // canvas.drawLine(Offset(826.3, 890.7), Offset(965.6, 1153.8), paint);
    // canvas.drawLine(Offset(965.6, 1153.8), Offset(991.5, 1322.7), paint);
    // canvas.drawLine(Offset(0, 0), Offset(500, 500), paint);
    // canvas.drawLine(Offset(300, 500), Offset(500, 500), paint);
    // canvas.drawLine(Offset(60, 60), Offset(100, 100), paint);

    paths.forEach((element) {
      print(element);
      if (element[0].dx != 0 &&
          element[0].dy != 0 &&
          element[1].dx != 0 &&
          element[1].dy != 0) canvas.drawLine(element[0], element[1], paint);
      // var path = Path();
      // path.moveTo(element[0].dx, element[0].dy);
      // path.lineTo(element[1].dx, element[1].dy);
      // print(path);
      // canvas.drawPath(path, paint);
    });

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
