import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/controller/cubit/login_cubit.dart';
import 'package:mawhibty/controller/states/login_states.dart';
import 'package:mawhibty/views/widgets/elevated_button_widget.dart';
import 'package:mawhibty/views/widgets/text_field_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
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
              title: const Text(
                'نسيت كلمةالمرور؟',
                style: TextStyle(color: primaryTextColor),
              ),
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                double screenHeight = MediaQuery.of(context).size.height;
                double screenWidth = MediaQuery.of(context).size.width;
                double verticalPadding = screenHeight * 0.03;
                double horizontalPadding = screenWidth * 0.05;

                return SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
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
                            const Row(
                              children: [
                                Text(
                                  'حصل خير… هنرجّعلك حسابك\nفي ثواني!',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
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
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'الرجاء إدخال بريد إلكتروني أو رقم هاتف صالح';
                                      }
                                      return null;
                                    },
                                    controller: emailController,
                                    hintText:
                                        'أدخل الهاتف أو البريد الإلكتروني',
                                    keyboardType: TextInputType.emailAddress,
                                    borderColor: primaryColor,
                                    borderWidth: 3.0,
                                    radius: 32.0,
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  CustomElevatedButton(
                                    buttonWidth: double.infinity,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {}
                                    },
                                    buttonText: 'ابعتولي الكود!',
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
      ),
    );
  }
}
