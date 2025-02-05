import 'package:app_manager_bloc_app/core/manager/bloc/app_manager_bloc.dart';
import 'package:app_manager_bloc_app/model/user_model.dart';
import 'package:app_manager_bloc_app/view/auth/bloc/auth_bloc.dart';
import 'package:app_manager_bloc_app/view/cart/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: username,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: password,
              ),
            ),
            BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
              if (state is SuccessLogin) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(),
                    ));
                context.read<AppManagerBloc>().add(LogInSuccessed());
              }
              if (state is Failed) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    "Failed To log in",
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            }, builder: (context, state) {
              if (state is AuthInitial || state is Failed || state is SuccessToLogOut) {
              return  ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          LogIn(
                            user: UserModel(
                              username: username.text,
                              password: password.text,
                            ),
                          ),
                        );
                  },
                  child: Text(
                    "Login",
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
          ],
        ),
      ),
    );
  }
}
