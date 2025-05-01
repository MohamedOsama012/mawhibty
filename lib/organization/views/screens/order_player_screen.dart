import 'package:flutter/material.dart';
import 'package:mawhibty/constants/colors.dart';

import 'package:mawhibty/controller/validation.dart';
import 'package:mawhibty/generated/l10n.dart';
import 'package:mawhibty/widgets/back_button_widget.dart';
import 'package:mawhibty/widgets/drop_down_menu_widget.dart';
import 'package:mawhibty/widgets/elevated_button_widget.dart';
import 'package:mawhibty/widgets/text_field_widget.dart';

class OrderPlayerScreen extends StatefulWidget {
  const OrderPlayerScreen({super.key});

  @override
  State<OrderPlayerScreen> createState() => _OrderPlayerScreenState();
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
  }
}

class _OrderPlayerScreenState extends State<OrderPlayerScreen> {
  TextEditingController dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? genderValue;
  String? sportValue;
  String? positionValue;

  final List<String> genders = ['Male', 'Female'];
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
  @override
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final verticalPadding = screenHeight * 0.03;
    final horizontalPadding = screenWidth * 0.05;
    final titleFontSize = screenWidth * 0.06;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'طلب لعيب',
          style: TextStyle(color: primaryTextColor),
        ),
        leading: const CustomBackButtonWidget(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "طلب لعيب",
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  DropDownMenuWidget(
                    options: genders,
                    labelText: "حدد نوعه",
                    selectedValue: genderValue,
                    borderColor: primaryColor,
                    onChanged: (value) {
                      setState(() {
                        genderValue = value;
                      });
                    },
                    validator: (value) => value == null || value.isEmpty
                        ? 'من فضلك اختر النوع'
                        : null,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  DropDownMenuWidget(
                    options: sports,
                    labelText: "بيلعب ايه؟",
                    selectedValue: sportValue,
                    borderColor: primaryColor,
                    onChanged: (value) {
                      setState(() {
                        sportValue = value;
                      });
                    },
                    validator: (value) => value == null || value.isEmpty
                        ? "من فضلك اختر الرياضة"
                        : null,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  DropDownMenuWidget(
                    options: positions,
                    labelText: "مركزه في الملعب؟",
                    selectedValue: positionValue,
                    borderColor: primaryColor,
                    onChanged: (value) {
                      setState(() {
                        positionValue = value;
                      });
                    },
                    validator: (value) => value == null || value.isEmpty
                        ? "من فضلك اختر المركز"
                        : null,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    controller: dateController,
                    hintText: 'تاريخ الميلاد',
                    keyboardType: TextInputType.datetime,
                    borderColor: primaryColor,
                    borderWidth: 3.0,
                    radius: 32.0,
                    suffix:
                        const Icon(Icons.calendar_month, color: primaryColor),
                    readOnly: true,
                    onTap: () => selectDate(context, dateController),
                    validator: (value) => validateDate(value, context),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  CustomElevatedButton(
                    buttonWidth: double.infinity,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Placeholder(),
                          ),
                        );
                      }
                    },
                    buttonText: S.of(context).registerAndStartJourney,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// try to commit to git hub
