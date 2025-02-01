import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<Increament>((event, emit) {
      counter++;
      emit(TheNumberIncreased(counter: counter));
    });

    on<Decreament>(
      (event, emit) {
        if (counter <= 0) {
        } else {
          counter--;
          emit(TheNumberDecreased(counter: counter));
        }
      },
    );

    on<ChangeValueFromTextField>(
      (event, emit) {
        if (int.parse(event.counterValue!) >= 0) {
          counter = int.parse(event.counterValue!);
          emit(CounterInitial());
        } else {
          emit(InvalidValue(lastValue: counter));
        }
      },
    );
  }
}
