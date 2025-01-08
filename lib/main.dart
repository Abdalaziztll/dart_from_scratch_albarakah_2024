import 'package:exlicit_animation_example/view/listtile_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListTileAnimationPage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation color;
  late Animation size;
  late Animation mutliSize;
  late Animation sizeWithCurve;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );
    color = ColorTween(begin: Colors.grey, end: Colors.red).animate(controller);
    size = Tween<double>(begin: 24.0, end: 40.0).animate(controller);
    mutliSize = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 30.0, end: 50.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 50.0, end: 30.0), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 30.0, end: 40.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 40.0, end: 30.0), weight: 10)
    ]).animate(controller);

    sizeWithCurve = Tween(begin: 30.0, end: 60.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.bounceInOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListTile(
        title: Text("Apple"),
        subtitle: Text(
          "IPhone 15 pro max ultra",
        ),
        trailing: IconButton(
          onPressed: () {
            if (controller.status == AnimationStatus.completed ||
                controller.status == AnimationStatus.forward) {
              controller.reverse();
            } else {
              controller.forward();
            }

            controller.addListener(() {
              print(color.value);
              print(size.value);
            });
          },
          icon: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return Icon(
                  Icons.favorite,
                  color: color.value,
                  size: sizeWithCurve.value,
                );
              }),
        ),
      )),
      floatingActionButton: Flow(
        delegate: MyDelegate(animation: controller),
        children: List.generate(
          4,
          (index) => FloatingActionButton(onPressed: () {}),
        ),
      ),
    );
  }
}

class MyDelegate extends FlowDelegate {
  late AnimationController animation;

  MyDelegate({required this.animation}) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    for (var i = 0; i < context.childCount; i++) {
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          // 0,
          (context.getChildSize(i)!.width * i * animation.value),
          (context.getChildSize(i)!.width * i * animation.value),
          0,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}
