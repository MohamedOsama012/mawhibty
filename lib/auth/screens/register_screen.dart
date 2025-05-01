import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/auth/screens/login_screen.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/controller/cubit/register/register_cubit.dart';
import 'package:mawhibty/controller/cubit/register/register_states.dart';
import 'package:mawhibty/controller/validation.dart';
import 'package:mawhibty/generated/l10n.dart';
import 'package:mawhibty/player/views/screens/player_account_setup_screen.dart';
import 'package:mawhibty/organization/views/screens/organization_account_setup_screen.dart';
import 'package:mawhibty/widgets/elevated_button_widget.dart';
import 'package:mawhibty/widgets/text_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (BuildContext context, RegisterStates state) {},
      builder: (BuildContext context, RegisterStates state) {
        final cubit = RegisterCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).register_screen_title,
              style: const TextStyle(color: primaryTextColor),
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              double screenHeight = MediaQuery.of(context).size.height;
              double screenWidth = MediaQuery.of(context).size.width;
              double verticalPadding = screenHeight * 0.03;
              double horizontalPadding = screenWidth * 0.05;
              return Padding(
                padding: EdgeInsetsDirectional.only(
                  top: verticalPadding,
                  start: horizontalPadding,
                  end: horizontalPadding,
                  bottom: verticalPadding,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  S.of(context).register_screen_welcome,
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
                                      validateName(value, context),
                                  controller: nameController,
                                  hintText:
                                      S.of(context).register_screen_name_hint,
                                  keyboardType: TextInputType.name,
                                  borderColor: primaryColor,
                                  borderWidth: 3.0,
                                  radius: 32.0,
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                CustomTextField(
                                  validator: (value) =>
                                      validateEmail(value, context),
                                  controller: emailController,
                                  hintText:
                                      S.of(context).register_screen_email_hint,
                                  keyboardType: TextInputType.emailAddress,
                                  borderColor: primaryColor,
                                  borderWidth: 3.0,
                                  radius: 32.0,
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                CustomTextField(
                                  validator: (value) =>
                                      validatePassword(value, context),
                                  controller: passwordController,
                                  hintText: S
                                      .of(context)
                                      .register_screen_password_hint,
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
                                      .register_screen_confirm_password_hint,
                                  suffix: IconButton(
                                    icon: Icon(cubit.confirmSuffix),
                                    onPressed: cubit.changeConfirmVisibility,
                                  ),
                                  isPassword: cubit.isConfirmPassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  borderColor: primaryColor,
                                  borderWidth: 3.0,
                                  radius: 32.0,
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'نادي',
                                      style: TextStyle(
                                        color: cubit.isPlayer
                                            ? const Color.fromRGBO(
                                                108, 108, 108, 1)
                                            : primaryColor,
                                        fontSize: 16,
                                        fontWeight: cubit.isPlayer
                                            ? FontWeight.normal
                                            : FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Transform.scale(
                                      scale: 1.1,
                                      child: Switch(
                                        value: cubit.isPlayer,
                                        onChanged: (value) {
                                          cubit.switchRole();
                                        },
                                        activeColor: Colors.white,
                                        activeTrackColor: primaryColor,
                                        inactiveThumbColor: Colors.white,
                                        inactiveTrackColor: primaryColor,
                                        trackOutlineColor:
                                            WidgetStateProperty.all(
                                                Colors.transparent),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'لاعب',
                                      style: TextStyle(
                                        color: cubit.isPlayer
                                            ? primaryColor
                                            : const Color.fromRGBO(
                                                108, 108, 108, 1),
                                        fontSize: 16,
                                        fontWeight: cubit.isPlayer
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.04),
                                CustomElevatedButton(
                                  buttonWidth: double.infinity,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      if (cubit.isPlayer) {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const PlayerAccountSetupScreen(),
                                            ),
                                            (_) => false);
                                      } else {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const OrganizationAccountSetupScreen(),
                                            ),
                                            (_) => false);
                                      }
                                    }
                                  },
                                  buttonText: S
                                      .of(context)
                                      .register_screen_register_button,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      S
                                          .of(context)
                                          .register_screen_have_account,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(124, 124, 124, 1),
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()),
                                            (_) => false);
                                      },
                                      child: Text(
                                        S
                                            .of(context)
                                            .register_screen_login_button,
                                        style: const TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color.fromRGBO(30, 30, 47, 1),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
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
