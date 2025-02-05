import 'package:app_manager_bloc_app/model/user_model.dart';
import 'package:app_manager_bloc_app/repo/repo.dart';

abstract class AuthRepo extends Repo {
  AuthRepo({required super.dio});

  Future<bool> logIn(UserModel user);
  Future<bool> logOut();
}
