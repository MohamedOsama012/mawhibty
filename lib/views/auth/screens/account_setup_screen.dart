import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/controller/cubit/register/register_cubit.dart';
import 'package:mawhibty/controller/cubit/register/register_states.dart';
import 'package:mawhibty/controller/validation.dart';
import 'package:mawhibty/generated/l10n.dart';
import 'package:mawhibty/views/auth/screens/login_screen.dart';
import 'package:mawhibty/views/widgets/drop_down_menu_widget.dart';
import 'package:mawhibty/views/widgets/elevated_button_widget.dart';
import 'package:mawhibty/views/widgets/text_field_widget.dart';

class AccountSetupScreen extends StatelessWidget {
  const AccountSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();

    final TextEditingController phoneControler = TextEditingController();
    final TextEditingController sportController = TextEditingController();
    final TextEditingController positionController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    String? selectedValue;

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
                                  controller: dateController,
                                  hintText:
                                      S.of(context).register_screen_name_hint,
                                  keyboardType: TextInputType.datetime,
                                  borderColor: primaryColor,
                                  borderWidth: 3.0,
                                  radius: 32.0,
                                  suffix: const Icon(
                                    Icons.calendar_month,
                                    color: primaryColor,
                                  ),
                                  readOnly: true,
                                  onTap: () =>
                                      cubit.selectDate(context, dateController),
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                CustomTextField(
                                  validator: (value) =>
                                      validateEmail(value, context),
                                  controller: phoneControler,
                                  hintText:
                                      S.of(context).register_screen_email_hint,
                                  keyboardType: TextInputType.phone,
                                  borderColor: primaryColor,
                                  borderWidth: 3.0,
                                  radius: 32.0,
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                DropDownMenuWidget(
                                  options: options,
                                  selectedValue: selectedValue,
                                  borderColor: Theme.of(context).primaryColor,
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                DropDownMenuWidget(
                                    options: options,
                                    selectedValue: selectedValue,
                                    onChanged: (value) {},
                                    borderColor: primaryColor),
                                SizedBox(height: screenHeight * 0.01),
                                CustomElevatedButton(
                                  buttonWidth: double.infinity,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Placeholder(), //Profile
                                        ),
                                      );
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
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()));
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
