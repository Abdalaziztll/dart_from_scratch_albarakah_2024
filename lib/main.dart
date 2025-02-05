import 'package:app_manager_bloc_app/core/manager/bloc/app_manager_bloc.dart';
import 'package:app_manager_bloc_app/core/manager/observer/bloc_observer.dart';
import 'package:app_manager_bloc_app/service/auth_service.dart';
import 'package:app_manager_bloc_app/service/product_service.dart';
import 'package:app_manager_bloc_app/view/auth/auth_page.dart';
import 'package:app_manager_bloc_app/view/auth/bloc/auth_bloc.dart';
import 'package:app_manager_bloc_app/view/cart/bloc/product_bloc.dart';
import 'package:app_manager_bloc_app/view/cart/product_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(
            ProductService(
              dio: Dio(),
            ),
          )..add(GetAllProduct()),
        ),
        BlocProvider(
          create: (context) => AppManagerBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            authRepo: AuthService(
              dio: Dio(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        home: BlocBuilder<AppManagerBloc, AppManagerState>(
          builder: (context, state) {
            if (state is Authentecated) {
              return ProductPage();
            } else if (state is NotAuthentecated) {
              return AuthPage();
            } else {
              return SplashScreen();
            }
          },
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthPage(),
            ),
          );
          print("---------------------------");
          context.read<AppManagerBloc>().add(FirstTimeDone());
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
