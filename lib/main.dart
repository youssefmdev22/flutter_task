import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/resources/app_theme.dart';
import 'core/utils/bloc_observer.dart';
import 'di/di.dart';
import 'features/products_screen/screen/products_screen.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: ProductsScreen(),
    );
  }
}
