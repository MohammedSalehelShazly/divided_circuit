import 'dart:math';
import 'package:flutter/material.dart';

import 'app_button.dart';
import 'main.dart';

// from: https://stackoverflow.com/questions/54269888/how-to-draw-a-custom-shape-in-flutter


class WithCustomPainter extends StatefulWidget {
  final int P;
  const WithCustomPainter(this.P);

  @override
  State<WithCustomPainter> createState() => _WithCustomPainterState();
}
class _WithCustomPainterState extends State<WithCustomPainter> {
  int piecePointer = -1;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                P: widget.P,
                icon: Icons.add_box_outlined,
                onTap: (){
                  if(piecePointer < widget.P-1){
                    setState(() {
                      piecePointer += 1;
                      print(piecePointer);
                    });
                  }
                },
              ),
              AppButton(
                P: widget.P,
                icon: Icons.indeterminate_check_box_outlined,
                onTap: (){
                  if(piecePointer >= 0){
                    setState(() {
                      piecePointer -= 1;
                      print(piecePointer);
                    });
                  }
                },
              ),
            ],
          ),
          
          CustomPaint(
            painter: WheelPainter(P: widget.P, piecePointer: piecePointer, size: circleSize(context)),
            child: SizedBox(
              height: circleSize(context),
              width: circleSize(context),
            ),
          ),
        ],
      ),
    );
  }
}

class WheelPainter extends CustomPainter {
  const WheelPainter({required this.P, required this.piecePointer, required this.size});
  final int P;
  final int piecePointer;
  final double size;
  Path getWheelPath(double wheelSize, double fromRadius, double toRadius) {
    return Path()
      ..moveTo(wheelSize, wheelSize)
      ..arcTo(Rect.fromCircle(radius: wheelSize, center: Offset(wheelSize, wheelSize)), fromRadius, toRadius, false)
      ..close();
  }

  Paint getColoredPaint(Color color) {
    Paint paint = Paint();
    paint.color = color;
    return paint;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double radius = (2 * pi) / P;
    for(int i=0 ;i<P; i++){
      Color color = i <= piecePointer
        ? mainClr
        : mainClr.withOpacity(.3);
      canvas.drawPath(getWheelPath(this.size, radius*i, radius), getColoredPaint(color));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

Color mainClr = const Color.fromRGBO(26, 147, 111, 1);