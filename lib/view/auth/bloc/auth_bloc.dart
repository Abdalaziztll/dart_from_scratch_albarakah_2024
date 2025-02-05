// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:app_manager_bloc_app/model/user_model.dart';
import 'package:app_manager_bloc_app/repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo authRepo;

  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<LogIn>((event, emit) async {
      emit(Loading());
      bool status = await authRepo.logIn(event.user);
      if (status) {
        emit(SuccessLogin());
      } else {
        emit(Failed());
      }
    });

    on<LogoutEvent>(
      (event, emit) {
        emit(Loading());
        emit(SuccessToLogOut());
      },
    );
  }
}
