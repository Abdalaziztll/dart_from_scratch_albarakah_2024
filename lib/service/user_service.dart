// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:riverpod_as_statemanagement/model/user_model.dart';

class UserService {
  Dio dio;
  String baseUrl = "https://jsonplaceholder.typicode.com/users/1";
  late Response respone;
  UserService({
    required this.dio,
  });

  Future<UserModel> getData() async {
    try {
      respone = await dio.get(baseUrl);
      print(respone.data);
      return UserModel.fromMap(respone.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
