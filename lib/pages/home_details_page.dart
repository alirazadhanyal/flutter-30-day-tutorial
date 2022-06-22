import 'package:flutter/material.dart';
import 'package:flutter_application/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class homeDetailsPage extends StatelessWidget {
  final Item catalog;

  const homeDetailsPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Image.network(catalog.image)],
      ),
    );
  }
}
