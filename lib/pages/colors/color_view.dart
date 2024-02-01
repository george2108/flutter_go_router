import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ColorView extends StatelessWidget {
  final MaterialColor color;
  final String colorName;

  const ColorView({
    super.key,
    required this.color,
    required this.colorName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(colorName),
      ),
      body: ListView.builder(
        itemCount: 9,
        itemBuilder: (context, index) {
          final shade = 100 * (index + 1);
          final variant = color[shade]!;
          return InkWell(
            child: Container(
              height: 100,
              color: variant,
            ),
            onTap: () {
              GoRouter.of(context).push('/$colorName/$shade');
            },
          );
        },
      ),
    );
  }
}
