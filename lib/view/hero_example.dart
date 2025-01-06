
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPage(),
                  ));
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Center(
        child: Hero(
          tag: '123',
          child: Container(
            
            child: Text('Hello World'),
            width: 300,
            height: 200,
            color: Colors.red,
          ),
        ),
      ),
      floatingActionButton:
          FloatingActionButton(heroTag: '22', onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: '22',
          child: Container(
            child: Text('Hello World'),
            width: 70,
            height: 70,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(heroTag: '21', onPressed: () {}),
          FloatingActionButton(onPressed: () {}),
        ],
      ),
    );
  }
}
