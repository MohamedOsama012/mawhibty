import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/controller/cubit/forget_password/forget_password_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(ForgetPasswordInitialState());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
}
