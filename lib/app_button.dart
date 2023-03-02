import 'package:flutter/material.dart';

import 'with_custom_painter.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.P, required this.onTap, required this.icon});
  final int P;
  final void Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: mainClr,
        child: Icon(icon, color: Colors.white)),
    );
  }
}