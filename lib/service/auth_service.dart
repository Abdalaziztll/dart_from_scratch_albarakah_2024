import 'package:app_manager_bloc_app/model/user_model.dart';
import 'package:app_manager_bloc_app/repo/auth_repo.dart';

class AuthService extends AuthRepo {
  AuthService({required super.dio});

  @override
  Future<bool> logIn(UserModel user) async {
    try {
      response = await dio.post(baseurlAuth, data: user.toMap(),);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> logOut()async {
    try {
      response=await dio.post(baseurlAuth);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
