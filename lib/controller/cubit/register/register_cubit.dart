import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/controller/cubit/register/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;

  IconData suffix = Icons.visibility_off_outlined;

  void changeVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(RegisterChangeVisibilityState());
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController dateController) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: primaryColor,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child!,
      ),
    );

    if (picked != null) {
      dateController.text =
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      emit(RegisterChangeDateState());
    }
  }

  final List<String> sports = ['Football', 'Basketball'];
  final List<String> positions = [
    'Goalkeeper',
    'Right Back',
    'Left Back',
    'Center Back',
    'Sweeper',
    'Defensive Midfielder',
    'Central Midfielder',
    'Attacking Midfielder',
    'Right Wing',
    'Left Wing',
    'Right Forward',
    'Left Forward',
    'Center Forward',
    'Striker',
    'Winger',
    'Attacking Midfielder (Central)',
    'Defensive Midfielder (Central)',
    'Second Striker',
    'Wide Midfielder',
    'Box-to-Box Midfielder',
  ];

  final List<String> genders = ['Male', 'Female'];

  String? genderValue;
  String? sportValue;
  String? positionValue;

  void changeSport(String? value) {
    sportValue = value;
    emit(RegisterChangeSportState());
  }

  void changePosition(String? value) {
    positionValue = value;
    emit(RegisterChangePositionState());
  }

  void changeGender(String? value) {
    genderValue = value;
    emit(RegisterChangeGenderState());
  }
}
