import 'package:cash_storing_with_service_layer/config/service_locater.dart';
import 'package:cash_storing_with_service_layer/model/handle_model.dart';
import 'package:cash_storing_with_service_layer/model/user_model.dart';
import 'package:cash_storing_with_service_layer/service/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ! 1-StateManagment : output : DataEntity 

// ?-1.5 UseCase
class UserProvider extends ChangeNotifier {
  UserService userService = UserService(dio: Dio());
  ResultModel pureData = ResultModel();

  // ! 2-Repository : output : DataModel
  void getProfile() async {
    print(pureData.runtimeType);
    if (await InternetConnectionChecker.instance.hasConnection) {
      // ! 3-Remote Repositry :  DataModel
      pureData = await userService.getUserProfile();
      sl.get<SharedPreferences>().setString(
            "newUser",
            (pureData as UserModel).toJson(),
          );
    } else {
      // ! 4-Local Repositry :  DataModel
      if (sl.get<SharedPreferences>().getString("newUser") == null) {
        pureData = HandleModel(
          message: "The Shared Prefernces is Empty",
        );
      } else {
        pureData = UserModel.fromJson(sl.get<SharedPreferences>().getString(
              "newUser",
            )!);
      }
    }
    notifyListeners();
  }
}
