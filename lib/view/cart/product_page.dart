import 'package:app_manager_bloc_app/core/manager/bloc/app_manager_bloc.dart';
import 'package:app_manager_bloc_app/view/auth/bloc/auth_bloc.dart';
import 'package:app_manager_bloc_app/view/cart/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SuccessToLogOut) {
                context.read<AppManagerBloc>().add(ReturnToFirstTimte());
              }
            },
          ),
          BlocListener<AppManagerBloc, AppManagerState>(
            listenWhen: (previous, current) => previous is FirstTimeApp,
            listener: (context, state) {
              if (state is NotAuthentecated) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.orange,
                    content: Text(
                      "PLEASE RE-Auth YOUR ACOUNT",
                    ),
                  ),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is SuccessToGetProduct) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.products[index].title),
                  subtitle: Text(state.products[index].description),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
