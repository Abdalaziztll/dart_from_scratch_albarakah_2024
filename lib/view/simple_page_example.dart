
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  ValueNotifier<int> counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: counter,
          builder: (context, value, child) {
            return Text(
              counter.value.toString(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
      ),
    );
  }
}
