import 'package:flutter/material.dart';

class GradientScreen extends StatelessWidget {
  const GradientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pColor = Theme.of(context).primaryColor;
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: pColor == Colors.white
                    ? [
                        Colors.blue,
                        Colors.red,
                      ]
                    : [Colors.red, Colors.blue])));
  }
}
