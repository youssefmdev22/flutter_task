import 'package:flutter/material.dart';

import 'di/di.dart';
import 'features/products_screen/products_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductsScreen(),
    );
  }
}
