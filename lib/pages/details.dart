import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final int id;

  const DetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detalle'),
      ),
      body: Center(
        child: Text(id.toString()),
      ),
    );
  }
}
