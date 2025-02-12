import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_as_statemanagement/provider/simple_provider.dart';
import 'package:riverpod_as_statemanagement/view/future_page.dart';
import 'package:riverpod_as_statemanagement/view/simple_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Consumer(
          builder: (context, ref, _) {
            return ref.watch(connnectionStatus).when(
                  data: (data) {
                    if (data.first == ConnectivityResult.wifi) {
                      return const FutureUserPage();
                    } else {
                      return const Scaffold(
                        backgroundColor: Colors.blue,
                        body: Center(
                          child: Text(
                            "Sorry There is a problem on your connection",
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  error: (error, stackTrace) {
                    print(error);
                    return CircularProgressIndicator();
                  },
                  loading: () => CircularProgressIndicator(),
                );
          },
        ),
      ),
    );
  }
}

