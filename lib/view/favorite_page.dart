import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:state_managment_session/provider/product_provider.dart';


class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListenableBuilder(
        listenable: GetIt.instance.get<ProductProvider>(),
        builder: (context, child) {
          return ListView.builder(
            itemCount: GetIt.instance.get<ProductProvider>().favorite.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: IconButton(
                    onPressed: () {
                      GetIt.instance.get<ProductProvider>().remove(GetIt
                          .instance
                          .get<ProductProvider>()
                          .favorite.elementAt(index));
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
                title: Text(
                    GetIt.instance.get<ProductProvider>().favorite.elementAt(index).name),
                subtitle: Text(GetIt.instance
                    .get<ProductProvider>()
                    .favorite.elementAt(index)
                    .brand),
              );
            },
          );
        },
      ),
    );
  }
}
