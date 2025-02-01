
import 'package:bloc_state_management/manager/lamp_bloc.dart';
import 'package:bloc_state_management/manager/lamp_event.dart';
import 'package:bloc_state_management/manager/lamp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LampPage extends StatelessWidget {
  const LampPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LampBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            context.read<LampBloc>().add(FixLamp());
          }),
          body: Center(
            child: InkWell(
              onTap: () {
                context.read<LampBloc>().add(ChangeLamp());
              },
              child: BlocBuilder<LampBloc, LampState>(
                builder: (context, state) {
                  print(state);
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state is TurnOnState
                          ? Colors.yellow
                          : state is BrokenLampState
                              ? Colors.black
                              : Colors.grey,
                    ),
                    width: 300,
                    height: 300,
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
