import 'package:bloc_state_management/view/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(FetchingProduct()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is SuccessToFetch) {
                return Column(
                  children: [
                    // ! CachedNetworkImage 
                    Image.network(state.product.image),
                    ListTile(
                      title: Text(state.product.name),
                      subtitle: Text(state.product.description),
                    )
                  ],
                );
              } else if (state is FailedState) {
                return Center(child: Text(state.message));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
