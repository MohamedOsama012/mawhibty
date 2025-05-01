import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/controller/cubit/login/login_cubit.dart';
import 'package:mawhibty/controller/cubit/login/login_states.dart';
import 'package:mawhibty/controller/validation.dart';
import 'package:mawhibty/generated/l10n.dart';
import 'package:mawhibty/auth/screens/forget_password_screen.dart';
import 'package:mawhibty/auth/screens/register_screen.dart';
import 'package:mawhibty/player/views/screens/player_layout.dart';
import 'package:mawhibty/widgets/elevated_button_widget.dart';
import 'package:mawhibty/widgets/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (BuildContext context) {
        return LoginCubit();
      },
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, LoginStates state) {},
        builder: (BuildContext context, LoginStates state) {
          final cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                S.of(context).login_screen_title,
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
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    S.of(context).login_screen_welcome,
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
                                        validateEmail(value, context),
                                    controller: emailController,
                                    hintText:
                                        S.of(context).login_screen_email_hint,
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
                                        .login_screen_password_hint,
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
                                  Row(
                                    children: [
                                      const Spacer(),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ForgetPasswordScreen()),
                                          );
                                        },
                                        child: Text(
                                          S
                                              .of(context)
                                              .login_screen_forget_password,
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color:
                                                Color.fromRGBO(30, 30, 47, 1),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomElevatedButton(
                                    buttonWidth: double.infinity,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BlocProvider.value(
                                              value: cubit,
                                              child: const PlayerLayout(),
                                            ),
                                          ),
                                          (route) => false,
                                        );
                                      }
                                    },
                                    buttonText:
                                        S.of(context).login_screen_login_button,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        S
                                            .of(context)
                                            .login_screen_create_account,
                                        style: const TextStyle(
                                          color:
                                              Color.fromRGBO(124, 124, 124, 1),
                                          fontSize: 16,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegisterScreen()),
                                              (route) => false);
                                        },
                                        child: Text(
                                          S
                                              .of(context)
                                              .login_screen_create_account_button,
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color:
                                                Color.fromRGBO(30, 30, 47, 1),
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
      ),
    );
  }
}
