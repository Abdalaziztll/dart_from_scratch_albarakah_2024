import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';
import 'package:some_widgets/model/product_model.dart';

void main() {
  runApp(const MyApp());
}

 // Expanded
 // Flexabile
 // FittedBox
 // MediaQurey
 // LayoutBuilder
 // FractionalSizedBox
 // AspectRatio
 // OrinationBuilder
 // ContstrainBox
 // SliverGridDelegateWithFixedCrossAxisCount
 // Wrap
 // screen_util
 // NavBar NavRail NavDrawer
 // Theme
 // Spacer
 // Gap
 // Flex
 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationOfListView(),
    );
  }
}

class AnimationOfListView extends StatefulWidget {
  AnimationOfListView({super.key});

  @override
  State<AnimationOfListView> createState() => _AnimationOfListViewState();
}

class _AnimationOfListViewState extends State<AnimationOfListView>
    with SingleTickerProviderStateMixin {
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<ProductModel> products = [
    ProductModel(name: "Iphone 6", price: "3000", brand: "Apple"),
    ProductModel(name: "Iphone 10", price: "9000", brand: "Apple"),
    ProductModel(name: "Iphone copy", price: "30", brand: "Banana"),
    ProductModel(name: "name", price: "price", brand: "brand")
  ];
  late AnimationController controller;
  List<Widget> lists = [];
  late Tween<Offset> position;

  @override
  void initState() {
    position = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      createAll();
    });
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    controller.repeat();
    super.initState();
  }

  Future future = Future(() {});
  createAll() {
    products.forEach((oneProduct) {
      _addToList(oneProduct);
    });
  }

  _addToList(ProductModel product) {
    future = future.then((_) async {
      await Future.delayed(
          Duration(
            milliseconds: 400,
          ), () {
        lists.add(
          ListTile(
            title: Text(product.name),
            subtitle: Text(product.price),
            trailing: Text(product.brand),
          ),
        );
        listKey.currentState!.insertItem(lists.length - 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: listKey,
        initialItemCount: lists.length,
        itemBuilder: (context, index, animation) => SlideTransition(
          position: animation.drive(position),
          child: lists[index],
        ),
      ),
      floatingActionButton: SingleChildScrollView(
        child: Row(
        
          children: [
            InkWell(
              onTap: () {
                controller.stop();
              },
              child:
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: Lottie.asset('assets/lottie/chicky.json', controller: controller)),
            ),SizedBox(
              width: 300,
              height: 300,
              child: RiveAnimation.network(

                        'https://cdn.rive.app/animations/vehicles.riv',
                      ),
            )
          ],
        ),
      ),
    );
  }
}


