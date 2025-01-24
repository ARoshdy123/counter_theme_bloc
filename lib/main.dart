import 'package:counter_theme_bloc/bloc/counter_bloc.dart';
import 'package:counter_theme_bloc/bloc/theme_bloc.dart';
import 'package:counter_theme_bloc/bloc/theme_state.dart';
import 'package:counter_theme_bloc/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: CounterPage(),
          );
        },
      ),
    );
  }
}
