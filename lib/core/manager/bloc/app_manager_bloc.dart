import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'app_manager_event.dart';
part 'app_manager_state.dart';

class AppManagerBloc extends HydratedBloc<AppManagerEvent, AppManagerState> {
  AppManagerBloc() : super(FirstTimeApp()) {
    on<LogInSuccessed>((event, emit) {
      emit(Authentecated());
    });

    on<FirstTimeDone>(
      (event, emit) {
        emit(NotAuthentecated());
      },
    );

    on<ReturnToFirstTimte>(
      (event, emit) {
        emit(FirstTimeApp());
      },
    );
  }

  @override
  AppManagerState? fromJson(Map<String, dynamic> json) {
    print(json['state']);
    if (json['state'] == "Authentecated") {
      return Authentecated();
    } else if (json['state'] == "NotAuthentecated") {
      return NotAuthentecated();
    } else {
      return FirstTimeApp();
    }
  }

  @override
  Map<String, dynamic>? toJson(AppManagerState state) {
    return {"state": state.runtimeType.toString()};
  }
}
