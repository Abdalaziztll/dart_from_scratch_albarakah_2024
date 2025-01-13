
import 'package:flutter/material.dart';

class TabletPage extends StatelessWidget {
  TabletPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture:
                      CircleAvatar(child: Icon(Icons.person)),
                  accountName: Text("data"),
                  accountEmail: Text(
                    "hdjsahjds",
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("Hello"),
                  subtitle: Text(
                    "Magna anim sint nisi voluptate magna",
                  ),
                )
              ],
            ),
          ),
          Expanded(flex: 2, child: child)
        ],
      ),
    );
  }
}




class ExpendedAndFlexPage extends StatelessWidget {
  const ExpendedAndFlexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
              height: 100,
              width: double.maxFinite,
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.green,
              height: 100,
              width: double.maxFinite,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
              height: 100,
              width: double.maxFinite,
            ),
          ),
        ],
      ),
    );
  }
}
