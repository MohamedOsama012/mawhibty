import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/controller/cubit/forget_password/forget_password_cubit.dart';
import 'package:mawhibty/controller/cubit/forget_password/forget_password_states.dart';
import 'package:mawhibty/views/widgets/elevated_button_widget.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final pinController = TextEditingController();
    final focusNode = FocusNode();

    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
      listener: (BuildContext context, ForgetPasswordStates state) {},
      builder: (BuildContext context, ForgetPasswordStates state) {
        final cubit = ForgetPasswordCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'تحقق من OTP',
              style: TextStyle(color: primaryTextColor),
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              double screenHeight = MediaQuery.of(context).size.height;
              double screenWidth = MediaQuery.of(context).size.width;
              double verticalPadding = screenHeight * 0.03;
              double horizontalPadding = screenWidth * 0.05;
              double boxSize = (screenWidth - (horizontalPadding * 2)) / 6;

              boxSize = boxSize.clamp(50, 80);

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
                          Row(
                            children: [
                              Text(
                                'الكود جالك... افتح الرسالة و ادخل \n الأرقام!',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.0598,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          SizedBox(height: screenHeight * 0.06),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Center(
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Pinput(
                                      length: 4,
                                      controller: pinController,
                                      preFilledWidget: const Text(
                                        '-',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال الرمز';
                                        } else if (value.length < 4) {
                                          return 'الرجاء إدخال الرمز الكامل';
                                        }
                                        return null;
                                      },
                                      focusNode: focusNode,
                                      onCompleted: (pin) {},
                                      onChanged: (value) {},
                                      defaultPinTheme: PinTheme(
                                        width: 56,
                                        height: 56,
                                        textStyle: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: primaryTextColor),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  '00:03:00م ',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    color: primaryTextColor,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'لم تتلق الرمز؟',
                                      style: TextStyle(
                                        color: Color.fromRGBO(124, 124, 124, 1),
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'أعد الإرسال',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color.fromRGBO(30, 30, 47, 1),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                CustomElevatedButton(
                                  buttonWidth: double.infinity,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {}
                                  },
                                  buttonText: 'تحقق',
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
