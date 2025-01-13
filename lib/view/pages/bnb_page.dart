import 'package:flutter/material.dart';
import 'package:responvie_app/main.dart';
import 'package:responvie_app/view/template/tablet_template.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    ExpendedAndFlexPage(),
    Scaffold(
      body: Center(
        child: Text(
          "Mobile Page",
        ),
      ),
    ),
    MobilePage()
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      body: pages[index],
      bottomNavigationBar: width < 400
          ? NavigationBar(
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              animationDuration: Duration(
                seconds: 3,
              ),
              selectedIndex: index,
              onDestinationSelected: (value) {
                setState(() {
                  index = value;
                });
              },
              destinations: [
                NavigationDestination(
                  selectedIcon: Icon(Icons.home_filled),
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.card_giftcard),
                  label: 'Cart',
                ),
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Map',
                ),
              ],
            )
          : null,
    );
  }
}
