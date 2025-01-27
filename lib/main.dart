import 'package:flutter/material.dart';
import 'package:state_managment_session/config/service_locater.dart';
import 'package:state_managment_session/view/product_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductPage(),
    );
  }
}
