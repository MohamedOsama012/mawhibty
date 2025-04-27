import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/controller/cubit/forget_password/forget_password_cubit.dart';
import 'package:mawhibty/controller/cubit/forget_password/forget_password_states.dart';
import 'package:mawhibty/controller/validation.dart';
import 'package:mawhibty/generated/l10n.dart';
import 'package:mawhibty/views/widgets/elevated_button_widget.dart';
import 'package:mawhibty/views/widgets/text_field_widget.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
      listener: (BuildContext context, ForgetPasswordStates state) {},
      builder: (BuildContext context, ForgetPasswordStates state) {
        final cubit = ForgetPasswordCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).new_password_screen_title,
              style: const TextStyle(color: primaryTextColor),
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              double screenHeight = MediaQuery.of(context).size.height;
              double screenWidth = MediaQuery.of(context).size.width;
              double verticalPadding = screenHeight * 0.03;
              double horizontalPadding = screenWidth * 0.05;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: verticalPadding,
                    start: horizontalPadding,
                    end: horizontalPadding,
                    bottom: verticalPadding,
                  ),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  S.of(context).new_password_screen_instruction,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.0598,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.06),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  validator: (value) =>
                                      validatePassword(value, context),
                                  controller: passwordController,
                                  hintText: S
                                      .of(context)
                                      .new_password_screen_password_hint,
                                  suffix: IconButton(
                                    icon: Icon(cubit.suffix),
                                    onPressed: cubit.changeVisibility,
                                  ),
                                  isPassword: cubit.isPassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  borderColor: primaryColor,
                                  borderWidth: 3.0,
                                  radius: 32.0,
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                CustomTextField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).password_required;
                                    }
                                    if (value != passwordController.text) {
                                      return S.of(context).password_mismatch;
                                    }
                                    return null;
                                  },
                                  controller: confirmPasswordController,
                                  hintText: S
                                      .of(context)
                                      .new_password_screen_confirm_password_hint,
                                  suffix: IconButton(
                                    icon: Icon(cubit.suffix),
                                    onPressed: cubit.changeVisibility,
                                  ),
                                  isPassword: cubit.isPassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  borderColor: primaryColor,
                                  borderWidth: 3.0,
                                  radius: 32.0,
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                CustomElevatedButton(
                                  buttonWidth: double.infinity,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BlocProvider.value(
                                            value: cubit,
                                            child:
                                                const Placeholder(), // Layout
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  buttonText: S
                                      .of(context)
                                      .new_password_screen_update_button,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
