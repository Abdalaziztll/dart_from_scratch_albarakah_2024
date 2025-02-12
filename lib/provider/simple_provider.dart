import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_as_statemanagement/model/user_model.dart';
import 'package:riverpod_as_statemanagement/service/user_service.dart';


final name = Provider<String>(
  (ref) => "Hello World",
);

final userService = Provider<UserService>(
  (ref) => UserService(
    dio: Dio(),
  ),
);

final getData = FutureProvider<UserModel>(
  (ref) => ref.watch(userService).getData(),
);

final connnectionStatus = StreamProvider<List<ConnectivityResult>>(
  (ref) {
    Connectivity check = Connectivity();
    return check.onConnectivityChanged;
  },
);


