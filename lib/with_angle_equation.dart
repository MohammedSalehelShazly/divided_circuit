import 'dart:math';
import 'package:flutter/material.dart';

import 'main.dart';

class WithAngleEquation extends StatelessWidget {
  const WithAngleEquation(this.P, {super.key});

  final int P;
    
  double getAngle(int index){
    var splitedAngel = 360/P;
    var lineAngel = splitedAngel*index;
    print(lineAngel);
    return lineAngel;
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: circleSize(context),
        width: circleSize(context),
        child: Stack(
          alignment: Alignment.center,
          children: [
            
            CircleAvatar(
              radius: circleSize(context)/2,
            ),
            
            if(P.isOdd)
              const Text('The equation calculates even subdivisions only'),
            
            if(P.isEven)
            ...List<Widget>.generate(P~/2, (i) => 
                Transform.rotate(
                angle: (getAngle(i)) *pi/180,
                child: Container(
                  color: Colors.black,
                  width: circleSize(context),
                  height: 2,
                ),
              )
            ),
          ]
        )
      )
  );
  }
}