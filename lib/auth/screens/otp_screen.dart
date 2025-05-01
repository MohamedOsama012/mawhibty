import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/controller/cubit/forget_password/forget_password_cubit.dart';
import 'package:mawhibty/controller/cubit/forget_password/forget_password_states.dart';
import 'package:mawhibty/generated/l10n.dart';
import 'package:mawhibty/auth/screens/new_password_screen.dart';
import 'package:mawhibty/widgets/back_button_widget.dart';
import 'package:mawhibty/widgets/elevated_button_widget.dart';
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
            title: Text(
              S.of(context).otp_screen_title,
              style: const TextStyle(color: primaryTextColor),
            ),
            leading: const CustomBackButtonWidget(),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              double screenHeight = MediaQuery.of(context).size.height;
              double screenWidth = MediaQuery.of(context).size.width;
              double verticalPadding = screenHeight * 0.03;
              double horizontalPadding = screenWidth * 0.05;
              double boxSize = (screenWidth - (horizontalPadding * 2)) / 6;

              boxSize = boxSize.clamp(50, 80);

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
                                  S.of(context).otp_screen_instruction,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.0598,
                                    fontWeight: FontWeight.w400,
                                  ),
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
                                      keyboardType: TextInputType.number,
                                      controller: pinController,
                                      preFilledWidget: const Text(
                                        '-',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return S.of(context).otp_required;
                                        } else if (value.length < 4) {
                                          return S.of(context).otp_not_complete;
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
                                  '00:03:00',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    color: primaryTextColor,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      S
                                          .of(context)
                                          .otp_screen_didnot_receive_code,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(124, 124, 124, 1),
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        S.of(context).otp_screen_resend_button,
                                        style: const TextStyle(
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
                                    if (formKey.currentState!.validate()) {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const NewPasswordScreen()),
                                          (route) => false);
                                    }
                                  },
                                  buttonText: S.of(context).otp_button,
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
