part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class SuccessLogin extends AuthState {}


class Failed extends AuthState {

}

class Loading extends AuthState {}

class SuccessToLogOut extends AuthState {}

