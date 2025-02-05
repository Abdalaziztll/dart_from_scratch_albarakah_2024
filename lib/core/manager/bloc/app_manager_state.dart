part of 'app_manager_bloc.dart';

@immutable
sealed class AppManagerState {}

final class AppManagerInitial extends AppManagerState {}


class FirstTimeApp extends AppManagerState {}

class Authentecated extends AppManagerState {}


class NotAuthentecated extends AppManagerState {}

