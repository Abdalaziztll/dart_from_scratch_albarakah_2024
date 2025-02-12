import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_as_statemanagement/provider/simple_provider.dart';

class FutureUserPage extends StatelessWidget {
  const FutureUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return ref.watch(getData).when(
              data: (data) {
                return ListTile(
                  title: Text(
                    data.name,
                  ),
                  subtitle: Text(
                    data.phone,
                  ),
                );
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return CupertinoActivityIndicator();
              },
            );
          },
        ),
      ),
    );
  }
}
