import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 0, 138, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    Path path = Path();
    path.moveTo(size.width*-0.0008333,size.height*-0.0014286);
    path.lineTo(size.width*0.2083333,0);
    path.lineTo(size.width*-0.0008333,size.height*0.3571429);
    path.lineTo(size.width*-0.0008333,size.height*-0.0014286);
    path.close();

    canvas.drawPath(path, paint_fill_0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.01
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;



    canvas.drawPath(path, paint_stroke_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
