import 'package:bloc_state_management/manager/lamp_event.dart';
import 'package:bloc_state_management/manager/lamp_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LampBloc extends Bloc<LampEvent, LampState> {
  int counter = 0;
  LampBloc() : super(InitiState()) {
    on<ChangeLamp>(
      (event, emit) {
        if (counter < 5) {
          if (state is TurnOnState) {
            emit(TurnOffState());
          } else {
            emit(TurnOnState());
            counter++;
          }
        } else {
          emit(BrokenLampState());
        }
      },
    );

    on<FixLamp>(
      (event, emit) {
        counter = 0;
        emit(InitiState());
      },
    );
  }
}
