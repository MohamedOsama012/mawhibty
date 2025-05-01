import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/controller/cubit/app/app_states.dart';
import 'package:mawhibty/player/views/screens/player_home_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    PlayerHomeScreen(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  List<String> titles = [
    'Home',
    'Messages',
    'prfile',
    'tasks',
  ];

  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }
}
