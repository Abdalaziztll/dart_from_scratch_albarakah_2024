import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:state_managment_session/provider/product_provider.dart';
import 'package:state_managment_session/view/favorite_page.dart';

  
class ProductPage extends StatelessWidget {
  ProductPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: GetIt.instance.get<ProductProvider>().products.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              GetIt.instance.get<ProductProvider>().addToFavorite(GetIt.instance.get<ProductProvider>().products[index]);
            },
            title: Text(GetIt.instance.get<ProductProvider>().products[index].name),
            subtitle: Text(GetIt.instance.get<ProductProvider>().products[index].brand),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FavoritePage(),
          ),
        );
      }),
    );
  }
}
