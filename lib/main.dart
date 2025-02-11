import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tdd_and_mocking/mock/mock_dio.dart';
import 'package:tdd_and_mocking/mock/mock_service.dart';
import 'package:tdd_and_mocking/service/product_service.dart';

void main() {
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

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "Hello",
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            content: Text("Hello World"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: MockService().getProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListTile(
                title: Text(snapshot.data!.name),
                subtitle: Text(
                  snapshot.data!.price,
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
