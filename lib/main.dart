import 'package:bloc_state_management/config/obserber.dart';
import 'package:bloc_state_management/view/counter/counter_page.dart';
import 'package:bloc_state_management/view/product/product_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductPage(),
    );
  }
}
