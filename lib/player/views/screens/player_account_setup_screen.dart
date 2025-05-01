import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/controller/cubit/register/register_cubit.dart';
import 'package:mawhibty/controller/cubit/register/register_states.dart';
import 'package:mawhibty/controller/validation.dart';
import 'package:mawhibty/generated/l10n.dart'; // This is where the localization comes from
import 'package:mawhibty/player/views/screens/player_layout.dart';
import 'package:mawhibty/widgets/drop_down_menu_widget.dart';
import 'package:mawhibty/widgets/elevated_button_widget.dart';
import 'package:mawhibty/widgets/text_field_widget.dart';

class PlayerAccountSetupScreen extends StatelessWidget {
  const PlayerAccountSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (BuildContext context, RegisterStates state) {},
      builder: (BuildContext context, RegisterStates state) {
        final cubit = RegisterCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).completeProfile,
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
                                  S.of(context).welcomeToStadiums,
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
                                  hintText: S.of(context).birthDate,
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
                                SizedBox(height: screenHeight * 0.02),
                                CustomTextField(
                                  validator: (value) =>
                                      validatePhone(value, context),
                                  controller: phoneController,
                                  hintText: S.of(context).phoneNumber,
                                  keyboardType: TextInputType.phone,
                                  borderColor: primaryColor,
                                  borderWidth: 3.0,
                                  radius: 32.0,
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                DropDownMenuWidget(
                                  options: cubit.genders,
                                  labelText: S.of(context).chooseGender,
                                  selectedValue: cubit.genderValue,
                                  borderColor: primaryColor,
                                  onChanged: (value) {
                                    cubit.changeGender(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).genderRequired;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                DropDownMenuWidget(
                                  options: cubit.sports,
                                  labelText: S.of(context).chooseSport,
                                  selectedValue: cubit.sportValue,
                                  borderColor: primaryColor,
                                  onChanged: (value) {
                                    cubit.changeSport(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).sportRequired;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                DropDownMenuWidget(
                                    options: cubit.positions,
                                    labelText: S.of(context).choosePosition,
                                    selectedValue: cubit.positionValue,
                                    onChanged: (value) {
                                      cubit.changePosition(value);
                                    },
                                    borderColor: primaryColor,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return S.of(context).positionRequired;
                                      }
                                      return null;
                                    }),
                                SizedBox(height: screenHeight * 0.04),
                                CustomElevatedButton(
                                  buttonWidth: double.infinity,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PlayerLayout(),
                                        ),
                                      );
                                    }
                                  },
                                  buttonText:
                                      S.of(context).registerAndStartJourney,
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
