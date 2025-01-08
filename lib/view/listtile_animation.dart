import 'package:flutter/material.dart';

class ListTileAnimationPage extends StatefulWidget {
  const ListTileAnimationPage({super.key});

  @override
  State<ListTileAnimationPage> createState() => _ListTileAnimationPageState();
}

class _ListTileAnimationPageState extends State<ListTileAnimationPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    offset = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return SlideTransition(
            position: offset,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index) {
                return ListTile(
                  title: Text("Hello Wolrd ${index}"),
                  subtitle: Text(
                    "Occaecat incididunt amet nulla ad officia et.",
                  ),
                );
              }
            ),
          );
        },
      ),
    );
  }
}
