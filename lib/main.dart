import 'dart:math';

import 'package:flutter/material.dart';

import 'with_angle_equation.dart';
import 'with_custom_painter.dart';

double circleSize(BuildContext context) => MediaQuery.of(context).orientation == Orientation.portrait
  ? MediaQuery.of(context).size.width/5
  : MediaQuery.of(context).size.height/5;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: WithAngleEquation(20),
      // home: WithCustomPainter(20),
    );
  }
}