import 'dart:math';

import 'package:flutter/material.dart';

class Arc extends StatelessWidget {
  final double _diameter;
  final double _percentage; // from 0 to 1
  final Color _color;

  const Arc(this._diameter, this._percentage, this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 30,
        child: CustomPaint(
          painter: MakeCircle(strokeWidth: 5, strokeCap: StrokeCap.round),
        ));
  }
}

/*return CustomPaint(
      painter: ArcPainter(_percentage, _color),
      size: Size(_diameter, _diameter),
    );*/

class ArcPainter extends CustomPainter {
  final double _percentage; // from 0 to 1
  final Color _color;

  const ArcPainter(this._percentage, this._color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = _color;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      0,
      _percentage * (2 * pi),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MakeCircle extends CustomPainter {
  final double strokeWidth;
  final StrokeCap strokeCap;

  MakeCircle({this.strokeCap = StrokeCap.square, this.strokeWidth = 10.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke; //important set stroke style

    final path = Path()
      ..moveTo(strokeWidth, strokeWidth)
      ..arcToPoint(Offset(size.width - strokeWidth, size.height - strokeWidth),
          radius: Radius.circular(max(size.width, size.height)));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
