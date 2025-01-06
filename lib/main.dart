import 'package:animation_intro/review/some_dart_concepts.dart';
import 'package:animation_intro/view/hero_example.dart';
import 'package:flutter/material.dart';

void main() {
  B b = B();
  b.someFunction();
  b.doAnoutherThing();
  b.doSomething();
  b.finallyDo();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationPageWithColorTween(),
    );
  }
}

// ! Responvie and Adabtive

// ? Implicit Animation

class ImpliciWidgetPage extends StatefulWidget {
  ImpliciWidgetPage({super.key});

  @override
  State<ImpliciWidgetPage> createState() => _ImpliciWidgetPageState();
}

class _ImpliciWidgetPageState extends State<ImpliciWidgetPage> {
  double width = 200;

  double height = 200;

  Color color = Colors.yellow;
  double value = 8;
  double isVisible = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: isVisible,
        duration: Duration(seconds: 2),
        child: AnimatedPadding(
          padding: EdgeInsets.only(left: value, top: value),
          duration: Duration(seconds: 2),
          child: AnimatedContainer(
            duration: Duration(seconds: 3),
            width: width,
            height: height,
            color: color,
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: isVisible == 1.0,
        replacement: SizedBox(
          width: 40,
          height: 40,
          child: Placeholder(),
        ),
        child: FloatingActionButton(onPressed: () {
          width = width + 20;
          height = height + 20;
          color = Colors.blue;
          value = value + 10;
          isVisible = 0.0;
          setState(() {});
        }),
      ),
    );
  }
}

class AnimationPageWithTween extends StatelessWidget {
  AnimationPageWithTween({super.key});
  Tween<double> animation = Tween<double>(begin: 0.0, end: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        tween: animation,
        duration: Duration(seconds: 3),
        builder: (context, value, _) {
          print(value);
          return Padding(
            padding: EdgeInsets.all(value * 20),
            child: Opacity(
              opacity: value,
              child: Text(
                "Hello My Friend",
                style: TextStyle(fontSize: value * 32),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimationPageWithColorTween extends StatelessWidget {
  AnimationPageWithColorTween({super.key});
  ColorTween color = ColorTween(begin: Colors.red, end: Colors.black);

  // ! this is not a soluation
  // Tween<Color> color = Tween<Color>(begin: Colors.red, end: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: color,
          duration: Duration(seconds: 3),
          builder: (context, value, child) {
            return Container(
              color: value,
              width: 300,
              height: 300,
            );
          },
        ),
      ),
    );
  }
}
