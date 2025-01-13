import 'package:flutter/material.dart';
import 'package:responvie_app/view/pages/bnb_page.dart';
import 'package:responvie_app/view/template/tablet_template.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(home: ReponsivePage());
  }
}

class ReponsivePage extends StatelessWidget {
  const ReponsivePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 400) {
            return  MainPage();
          } else {
            return FlutterLogosPage();
          }
        },
      ),
    );
  }
}

class MobilePage extends StatelessWidget {
  const MobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: List.generate(
              3,
              (index) => Tab(
                child: Text(
                  index.toString(),
                ),
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                otherAccountsPictures: [
                  Icon(Icons.person),
                  Icon(Icons.person),
                  Icon(Icons.person)
                ],
                currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
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
        body: TabBarView(
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}

class FlutterLogosPage extends StatelessWidget {
  const FlutterLogosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TabletPage(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        itemBuilder: (context, index) => SizedBox(
          width: 300,
          height: 300,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
