import 'package:flutter/material.dart';

class ColorDetailView extends StatelessWidget {
  final Color color;

  const ColorDetailView({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
      ),
      body: Container(
        color: color,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
