import 'package:counter_theme_bloc/bloc/theme_event.dart';
import 'package:counter_theme_bloc/bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: ThemeData.light())) {
    on<ChangeThemeEvent>((event, emit) {
      emit(ThemeState(
        themeData: state.themeData.brightness == Brightness.dark
            ? ThemeData.light()
            : ThemeData.dark(),
      ));
    });
  }
}
