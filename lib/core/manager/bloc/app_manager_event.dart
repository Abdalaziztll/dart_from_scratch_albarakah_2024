part of 'app_manager_bloc.dart';

@immutable
sealed class AppManagerEvent {}


class LogInSuccessed extends AppManagerEvent {}

class FirstTimeDone extends AppManagerEvent {}

class ReturnToFirstTimte extends AppManagerEvent {}