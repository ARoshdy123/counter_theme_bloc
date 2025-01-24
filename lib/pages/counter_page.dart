import 'package:counter_theme_bloc/bloc/counter_bloc.dart';
import 'package:counter_theme_bloc/bloc/counter_event.dart';
import 'package:counter_theme_bloc/bloc/counter_state.dart';
import 'package:counter_theme_bloc/bloc/theme_bloc.dart';
import 'package:counter_theme_bloc/bloc/theme_event.dart';
import 'package:counter_theme_bloc/bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    final themeBloc = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Counter App')),
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () => themeBloc.add(ChangeThemeEvent()),
                  icon: Icon(state.themeData.brightness == Brightness.dark
                      ? Icons.light_mode
                      : Icons.dark_mode));
            },
          )
        ],
      ),
      body: Center(
        child: BlocListener<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state.count == 10) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Counter reached 10')),
              );
            }
          },
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                '${state.count}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterBloc.add(CounterIncrementPressed()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
