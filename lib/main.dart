import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:state_managment_bloc/bloc/my_products_bloc.dart';
import 'package:state_managment_bloc/config/observe.dart';
import 'package:state_managment_bloc/config/service_locater.dart';
import 'package:state_managment_bloc/service/product_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setup();
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

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<MyProductsBloc>()..add(
          GetAllProduct(),
        ),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocConsumer<MyProductsBloc, MyProductsState>(
            listener: (context, state) {
              if (state is AddedToFavorite) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Added To Favorite",
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is SuccessToGetProducts) {
                return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) => ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          context.read<MyProductsBloc>().add(
                                LikeOneProduct(
                                  productModel: state.products[index],
                                ),
                              );
                        },
                        icon: Icon(Icons.favorite)),
                    title: Text(state.products[index].name),
                    subtitle: Text(state.products[index].description),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<MyProductsBloc>()..add(GetMyFavorite()),
                  child: Builder(builder: (context) {
                    return FavoritePage();
                  }),
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<MyProductsBloc>().add(RemoveAll());
              },
              icon: Icon(Icons.remove_done_rounded))
        ],
      ),
      body: BlocConsumer<MyProductsBloc, MyProductsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is SuccessToGetFavorite) {
            return ListView.builder(
              itemCount: state.favorite.length,
              itemBuilder: (context, index) => ListTile(
                trailing: IconButton(
                    onPressed: () {
                      context.read<MyProductsBloc>().add(
                            DisLikeOneProduct(
                              id: state.favorite[index].id,
                            ),
                          );
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: state.favorite[index].isFav
                          ? Colors.red
                          : Colors.grey,
                    )),
                title: Text(state.favorite[index].name),
                subtitle: Text(state.favorite[index].description),
              ),
            );
          } else {
            return Center(
              child: Text("There is Nothing in Favorite"),
            );
          }
        },
      ),
    );
  }
}
