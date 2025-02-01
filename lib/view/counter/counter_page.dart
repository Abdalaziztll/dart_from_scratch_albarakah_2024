import 'package:bloc_state_management/view/counter/bloc/counter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: SizedBox(
              width: 300,
              child: TextField(
                onChanged: (val) {
                  context.read<CounterBloc>().add(
                        ChangeValueFromTextField(
                          counterValue: val,
                        ),
                      );
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Decreament());
                  },
                  icon: Icon(Icons.minimize))
            ],
          ),
          body: Center(
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is TheNumberIncreased) {
                  return Text(state.counter.toString());
                } else if (state is TheNumberDecreased) {
                  return Text(state.counter.toString());
                } else if (state is InvalidValue) {
                  return Text(state.lastValue.toString());
                } else {
                  return CupertinoActivityIndicator();
                }
              },
            ),
          ),
          floatingActionButton: BlocListener<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state is InvalidValue) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Invalid Input for Number , Try to add Positive Value",
                    ),
                    backgroundColor: Colors.blue,
                  ),
                );
              }
            },
            child: FloatingActionButton(onPressed: () {
              context.read<CounterBloc>().add(
                    Increament(),
                  );
            }),
          ),
        );
      }),
    );
  }
}
